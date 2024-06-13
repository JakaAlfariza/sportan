import 'package:flutter/material.dart';
import 'dart:async';
import 'customappbar.dart';
import 'readnewspage.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class NewsItem {
  final String title;
  final String imagePath;
  final String content;

  NewsItem(
      {required this.title, required this.imagePath, required this.content});
}

class _HomeState extends State<Home> {
  late Timer _timer;
  late DateTime targetDate;
  late String countdownText;

  List<NewsItem> allNewsItems = [
    NewsItem(
      title: 'Ini Contoh Berita 1',
      imagePath: 'images/n1.png',
      content: 'Ini Contoh Berita 1',
    ),
    NewsItem(
      title: 'Ini Contoh Berita 2',
      imagePath: 'images/n2.png',
      content: 'Ini Contoh Berita 2',
    ),
    NewsItem(
      title: 'Ini Contoh Berita 3',
      imagePath: 'images/n3.png',
      content: 'Ini Contoh Berita 3',
    ),
    NewsItem(
      title: 'Ini Contoh Berita 4',
      imagePath: 'images/n4.png',
      content: 'Ini Contoh Berita 4',
    ),
    NewsItem(
      title: 'Ini Contoh Berita 5',
      imagePath: 'images/n5.png',
      content: 'Ini Contoh Berita 5',
    ),
    NewsItem(
      title: 'Ini Contoh Berita 6',
      imagePath: 'images/n6.png',
      content: 'Ini Contoh Berita 6',
    ),
  ];

  @override
  void initState() {
    super.initState();
    initializeTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void initializeTimer() {
    targetDate = DateTime.now().add(Duration(days: 1, minutes: 2));
    updateCountdownText();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      updateCountdownText();
    });
  }

  void updateCountdownText() {
    final now = DateTime.now();
    final difference = targetDate.difference(now);
    setState(() {
      if (difference.inSeconds <= 0) {
        countdownText = "It's Race time!";
        _timer.cancel();
      } else {
        countdownText =
            '${difference.inDays}d ${difference.inHours.remainder(24)}h ${difference.inMinutes.remainder(60)}m ${difference.inSeconds.remainder(60)}s';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildCountdownSection(),
            buildImageSection(),
            buildRaceHighlightsSection(),
            buildNewsSection(),
          ],
        ),
      ),
    );
  }

  Widget buildCountdownSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/grey.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Pertamina Grand Prix of Indonesia - Mandalika Circuit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            countdownText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageSection() {
    return Container(
      height: 350,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/kaza.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.transparent,
                ],
                stops: [0.35, 1.0],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Kazakhstan Is Officially Back To MotoGP Calendar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadNewsPage(
                            imagePath: 'images/kaza.jpg',
                            title:
                                'Kazakhstan Is Officially Back To MotoGP Calendar',
                            content:
                                'Ini contoh berita utamanya',
                          ),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Read Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRaceHighlightsSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Race Highlights',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildImageCard('images/h1.png', '#CatalanGP - MotoGP 2024'),
                buildImageCard('images/h2.png', '#FrenchGP - MotoGP 2024'),
                buildImageCard('images/h3.png', '#SpanishGP - MotoGP 2024'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImageCard(String imagePath, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNewsSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 16, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Page2(allNewsItems: allNewsItems)
                    ),
                  );
                },
                icon: Icon(Icons.arrow_right_alt),
                label: Text('Show All'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(3, (index) {
              final newsItem = allNewsItems[index];
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadNewsPage(
                          imagePath: newsItem.imagePath,
                          title: newsItem.title,
                          content: newsItem.content,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset(
                          newsItem.imagePath,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              newsItem.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final List<NewsItem> allNewsItems;

  Page2({required this.allNewsItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: allNewsItems.length,
        itemBuilder: (context, index) {
          final newsItem = allNewsItems[index];
          return Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReadNewsPage(
                      imagePath: newsItem.imagePath,
                      title: newsItem.title,
                      content: newsItem.content,
                    ),
                  ),
                );
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      newsItem.imagePath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          newsItem.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
