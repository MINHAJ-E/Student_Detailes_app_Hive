// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_hive_project_3/model/model.dart';

class userProfileView extends StatelessWidget {
  final String name;
  final String age;
  final String phone;
  final String adress;
  // final String imagePath;

  const userProfileView({
    required this.name,
    required this.age,
    required this.phone,
    required this.adress,
    // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        // elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        backgroundColor: Colors.amber,
        title: Text('PROFILE'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("images/computer.jpg"),
              ),
            ),
            SizedBox(height: 30),
            CardItem(
              title: 'Name',
              content: name,
            ),
            CardItem(
              title: 'Age',
              content: age,
            ),
            CardItem(
              title: 'Place',
              content: phone,
            ),
            CardItem(
              title: 'Phone',
              content: adress,
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String content;

  const CardItem({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Colors.amber;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: bgColor,
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
               
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
