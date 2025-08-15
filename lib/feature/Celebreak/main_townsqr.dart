import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/const/constant.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/screens/main_screen.dart';

class MainTownSQR extends StatelessWidget {
  const MainTownSQR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashborad UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}
