import 'package:flutter/material.dart';
import 'customappbar.dart';

class Standings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StandingsPage(),
    );
  }
}

class StandingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'MotoGP 2024 Standings - After #ItalianGP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            "images/s1.png",
          ),
        ],
      ),
    );
  }
}
