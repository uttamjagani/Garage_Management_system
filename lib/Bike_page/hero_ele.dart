// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Hero_ele extends StatefulWidget {
  const Hero_ele({super.key});

  @override
  State<Hero_ele> createState() => _Hero_eleState();
}

class _Hero_eleState extends State<Hero_ele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hero Electric',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/Garage_icon.png',
            width: 5.0,
            height: 5.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
            body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildImageContainer('Hero Electric Optima\n  Rs. 1.06 - 1.29 Lakh ', 'assets/hero_ele/img_1.webp'),
            buildImageContainer('Hero Electric Atria \n      Rs. 77,690 ', 'assets/hero_ele/img_2.webp'),
            buildImageContainer('  Hero Electric Flash\n        Rs. 59,640 ', 'assets/hero_ele/img_3.webp'),
            buildImageContainer('   Hero Electric NYX \n Rs. 73,590 - 86,540 ', 'assets/hero_ele/img_4.webp'),
            buildImageContainer('Hero Electric Eddy\n     Rs. 72,000 ', 'assets/hero_ele/img_5.webp'),
            //buildImageContainer('Hero Electric Photon\n     Rs. 1.10 Lakh ', 'assets/hero_ele/img_6.webp'),
          ],
        ),
      ),
    );
  }

  Widget buildImageContainer(String text, String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 230.0,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                
              ),
            ),
          ),
          SizedBox(height: 8.0),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
