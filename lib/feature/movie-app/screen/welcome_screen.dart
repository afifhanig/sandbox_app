import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/movie-app/controller/authentication_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AuthenticationController _ac;

  @override
  void initState() {
    _ac = Get.put(AuthenticationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Welcome')],
        ),
      ),
    );
  }
}