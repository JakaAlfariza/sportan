import 'package:flutter/material.dart';
import 'dart:async';
import 'package:lat2/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 8), () {});
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgsportan.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.65),
                  BlendMode.darken),
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('images/sportan1.png'),
          ),
        ),
      ),
    );
  }
}
