import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/controller/another_controller.dart';
import 'package:sandbox_flutter_3/controller/app_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> with WidgetsBindingObserver {
  var _progress = 0;
  late WebViewController _webViewController;
  bool isLoading = true;
  //
  late Timer _timer;
  bool isInBackground = false;
  int countTimerHitBE = 0;
  final AnotherController _anotherController = Get.put(AnotherController());

  @override
  void initState() {
    startTimerForeground();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    // if (controller.platform is AndroidWebViewController) {
    //   AndroidWebViewController.enableDebugging(true);
    //   (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    // }

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
            setState(() {
              _progress = 0;
            });
          },
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            setState(() {
              _progress = progress;
            });
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            setState(() {
              _progress = 100;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            //_launchURL(request.url);
            print('adakah : ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(
          //'https://sample2-embed-iframe-web.netlify.app/index-signin.html?name=Crist&email=aa@gmail&phone=9988',
          //'https://google.com',
          'https://www.google.com/'
          //'https://flutter.dev/',
          //'https://m.youtube.com/'
          //'https://store.steampowered.com/'
          //'https://m.twitch.tv/',
          ));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }

    _webViewController = controller;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.resumed) {
        debugPrint('-- app is RESUMING --');
        _timer.cancel();
        _timer.isActive ? debugPrint('timer is active') : debugPrint('timer is not active');
        setState(() {
          countTimerHitBE = 0;
        });
        startTimerForeground();
      } else if (state == AppLifecycleState.paused) {
        debugPrint('-- app is IN BACKGROUND --');
        _timer.cancel();
        _timer.isActive ? debugPrint('timer is active') : debugPrint('timer is not active');
        startTimerBackground();
      }
    });
  }

  startTimerForeground() async {
    debugPrint('timer 1');
    await backEndHitMethod();
    _timer = Timer.periodic(const Duration(seconds: 2700), (timer) {
      debugPrint('dari function foregroundSessionTimer');
      backEndHitMethod();
    });
    debugPrint(_timer.isActive ? 'yes' : 'no');
  }

  startTimerBackground() async {
    debugPrint('timer 2');
    await backEndHitMethod();
    _timer = Timer.periodic(const Duration(seconds: 2700), (timer) {
      debugPrint('dari function backgroundSessionTimer');
      setState(() {
        countTimerHitBE = countTimerHitBE + 1;
      });
      debugPrint('$countTimerHitBE');
      backEndHitMethod();
      if (countTimerHitBE == 3) {
        timer.cancel();
        debugPrint('timer cancel');
      }
    });
    debugPrint(_timer.isActive ? 'yes' : 'no');
  }

  backEndHitMethod() async {
    debugPrint('hit BE');
    await _anotherController.ambilData();
    //print('printing result 1');
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer.isActive ? debugPrint('timer is active') : debugPrint('timer is not active');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Iframe chatboot'),
            backgroundColor: Colors.blue,
          )),
      body: SizedBox(
        // height: double.infinity,
        // width: double.infinity,
        child: Column(
          children: <Widget>[
            if (_progress < 100)
              LinearProgressIndicator(
                color: Colors.red,
                value: _progress / 100.0,
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Stack(
                  children: [
                    WebViewWidget(
                      controller: _webViewController,
                    ),
                    //Text(Get.currentRoute)
                    // Listener(
                    //   behavior: HitTestBehavior.translucent,
                    //   onPointerDown: (event) => print('testing1 $event ${DateTime.now()}'),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
