// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class New_Launch extends StatefulWidget {
  const New_Launch({super.key});

  @override
  State<New_Launch> createState() => _New_LaunchState();
}

class _New_LaunchState extends State<New_Launch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Launch Bikes',
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
            buildImageContainer('Bajaj Pulsar NS200 \n     Rs. 1.49 Lakh', 'assets/bajaj/img1.webp'),
            buildImageContainer('Bajaj Pulsar NS 125 \n        Rs. 99,571', 'assets/bajaj/img2.webp'),
            buildImageContainer('   Bajaj Pulsar 150 \nRs. 1.10 - 1.15 Lakh', 'assets/bajaj/img3.webp'),
            buildImageContainer('   Bajaj Pulsar 125 \nRs. 80,416 - 94,138', 'assets/bajaj/img4.webp'),
            buildImageContainer('Bajaj Pulsar N160 \n    Rs. 1.30 Lakh', 'assets/bajaj/img5.webp'),
            buildImageContainer('Bajaj Pulsar RS200 \n     Rs. 1.72 Lakh ', 'assets/bajaj/img6.webp'),
            buildImageContainer('Bajaj Pulsar NS160 \n     Rs. 1.36 Lakh', 'assets/bajaj/img7.webp'),
            buildImageContainer('Bajaj Pulsar 220 F \n    Rs. 1.37 Lakh ', 'assets/bajaj/img8.webp'),
            buildImageContainer('Bajaj Pulsar N150 \n   Rs. 1.17 Lakh ', 'assets/bajaj/img9.webp'),
            buildImageContainer('Bajaj Dominar 400 \n    Rs. 2.29 Lakh ', 'assets/bajaj/img10.webp'),
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
