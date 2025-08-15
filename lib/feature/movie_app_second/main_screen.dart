import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/movie-app/constant/app_movies_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:app_links/app_links.dart';

class LoginMovieScreen extends StatefulWidget {
  @override
  State<LoginMovieScreen> createState() => _LoginMovieScreenState();
}

class _LoginMovieScreenState extends State<LoginMovieScreen> {
  late final AppLinks _appLinks;
  String? _requestToken;

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    _initAppLinks();
  }

  Future<String> createRequestToken() async {
    String reqToken = '';
    try {
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/authentication/token/new'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $apiKey',
      });
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        reqToken = jsonResponse['request_token'];
      }
    } catch (e) {
      print(e);
    }

    return reqToken;
  }

  String getAuthorizationUrl(String requestToken) {
    return 'https://www.themoviedb.org/authenticate/$requestToken?redirect_to=http://www.yourapp.com/approved';
  }

  Future<void> launchAuthUrl(String authUrl) async {
    if (await canLaunchUrl(Uri.parse(authUrl))) {
      await launchUrl(Uri.parse(authUrl));
    } else {
      throw 'Could not launch $authUrl';
    }
  }

  Future<void> startAuthentication() async {
    try {
      String requestToken = await createRequestToken();
      String authUrl = getAuthorizationUrl(requestToken);
      await launchAuthUrl(authUrl);
    } catch (e) {
      print('Error starting authentication: $e');
    }
  }

  Future<void> _initAppLinks() async {
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        final requestToken = uri.queryParameters['request_token'];
        if (requestToken != null) {
          setState(() {
            _requestToken = requestToken;
          });
          _handleRequestToken(requestToken);
        }
      }
    });

    final initialUri = await _appLinks.getInitialAppLink();
    if (initialUri != null) {
      final requestToken = initialUri.queryParameters['request_token'];
      if (requestToken != null) {
        setState(() {
          _requestToken = requestToken;
        });
        _handleRequestToken(requestToken);
      }
    }
  }

  Future<void> _handleRequestToken(String requestToken) async {
    try {
      final sessionId = await createSession(requestToken);
      await saveSessionId(sessionId);
      // Navigate to the main part of your app
    } catch (e) {
      print('Error handling request token: $e');
    }
  }

  Future<String> createSession(String requestToken) async {
    final response = await http.post(
      Uri.parse('https://api.themoviedb.org/3/authentication/session/new?api_key=$apiKey'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'request_token': requestToken}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['session_id'];
    } else {
      throw Exception('Failed to create session');
    }
  }

  Future<void> saveSessionId(String sessionId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('session_id', sessionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            startAuthentication();
          },
          child: Text('Login with TMDb'),
        ),
      ),
    );
  }
}
