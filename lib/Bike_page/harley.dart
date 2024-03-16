// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Harley extends StatefulWidget {
  const Harley({super.key});

  @override
  State<Harley> createState() => _HarleyState();
}

class _HarleyState extends State<Harley> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Harley Davidson',
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
            buildImageContainer('Harley-Davidson X440\n Rs. 2.39 - 2.79 Lakh ', 'assets/harley/img_1.webp'),
            buildImageContainer('Harley-Davidson Sportster S\n         Rs. 15.54 Lakh ', 'assets/harley/img_2.webp'),
            buildImageContainer('Harley-Davidson Fat Boy 114 \n          Rs. 24.49 Lakh ', 'assets/harley/img_3.webp'),
            buildImageContainer('Harley-Davidson Pan America 1250\n        Rs. 18.25 - 21.24 Lakh ', 'assets/harley/img_4.webp'),
            buildImageContainer('Harley-Davidson Nightster\n  Rs. 12.24 - 12.99 Lakh ', 'assets/harley/img_5.webp'),
            buildImageContainer('Harley-Davidson Fat Bob \n      Rs. 20.49 Lakh ', 'assets/harley/img_6.webp'),
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

