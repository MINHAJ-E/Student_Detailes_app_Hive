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
        // elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        backgroundColor:Colors.amber,
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
                color:Colors.amber,
               
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
              isAlternate: false,
             
            ),
            CardItem(
              title: 'Age',
              content: age,
              isAlternate: true,
            ),
            CardItem(
              title: 'Place',
              content: phone,
              isAlternate: false,
            ),
            CardItem(
              title: 'Phone',
              content: adress,
              isAlternate: true,
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
  final bool isAlternate;

  const CardItem({
    required this.title,
    required this.content,
    required this.isAlternate,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isAlternate ? Colors.amber : Colors.amber;
    // final textColor =
        // isAlternate ? Color.fromARGB(255, 247, 230, 2) : Colors.white;
      
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
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
                // color: textColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }
}