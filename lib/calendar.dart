import 'package:flutter/material.dart';
import 'customappbar.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'images/r1.png',
      'images/r2.png',
      'images/r3.png',
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'MotoGP 2024 Official Calendar',
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
