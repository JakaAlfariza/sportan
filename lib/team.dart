import 'package:flutter/material.dart';
import 'customappbar.dart';

class Team extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamPage(),
    );
  }
}

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'images/t1.png',
      'images/t2.png',
      'images/t3.png',
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: 10), // Added bottom padding of 10
              child: Text(
                'MotoGP 2024 Teams & Riders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(3.0),
                  child: Card(
                    child: Image.asset(
                      imagePaths[index % imagePaths.length],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
