// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Yamaha extends StatefulWidget {
  const Yamaha({super.key});

  @override
  State<Yamaha> createState() => _YamahaState();
}

class _YamahaState extends State<Yamaha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yamaha',
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
            buildImageContainer('    Yamaha MT 15 V2 \nRs. 1.67 - 1.72 Lakh ', 'assets/yamaha/img_1.jpeg'),
            buildImageContainer('     Yamaha R15 V4 \nRs. 1.81 - 1.97 Lakh ', 'assets/yamaha/img_2.webp'),
            buildImageContainer('Yamaha R15S \n Rs. 1.64 Lakh ', 'assets/yamaha/img_3.webp'),
            buildImageContainer('  Yamaha FZS-FI V3 \nRs. 1.21 - 1.22 Lakh', 'assets/yamaha/img_4.webp'),
            buildImageContainer('Yamaha FZ-FI Version 3.0\n        Rs. 1.16 Lakh ', 'assets/yamaha/img_5.webp'),
            buildImageContainer('  Yamaha FZS-FI V4 \n Rs. 1.28 - 1.29 Lakh  ', 'assets/yamaha/img_6.webp'),
            buildImageContainer('       Yamaha FZ-X \n  Rs. 1.36 - 1.37 Lakh ', 'assets/yamaha/img_7.webp'),
            buildImageContainer('Yamaha MT-03 \n Rs. 4.59 Lakh  ', 'assets/yamaha/img_8.webp'),
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
