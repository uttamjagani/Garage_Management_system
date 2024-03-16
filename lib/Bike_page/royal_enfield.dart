// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Royal_Enfield extends StatefulWidget {
  const Royal_Enfield({super.key});

  @override
  State<Royal_Enfield> createState() => _Royal_EnfieldState();
}

class _Royal_EnfieldState extends State<Royal_Enfield> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Royal Enfield',
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
            buildImageContainer('Royal Enfield Classic 350 \n    Rs. 1.93 - 2.24 Lakh', 'assets/royal_enfield/img_1.webp'),
            buildImageContainer('Royal Enfield Hunter 350 \n    Rs. 1.49 - 1.74 Lakh ', 'assets/royal_enfield/img_2.jpeg'),
            buildImageContainer('Royal Enfield Bullet 350 \n   Rs. 1.73 - 2.15 Lakh ', 'assets/royal_enfield/img_3.webp'),
            buildImageContainer('Royal Enfield Continental GT 650 \n           Rs. 3.19 - 3.45 Lakh ', 'assets/royal_enfield/img_4.webp'),
            buildImageContainer('Royal Enfield Himalayan 450 \n     Rs. 2.85 - 2.98 Lakh', 'assets/royal_enfield/img_5.webp'),
            buildImageContainer('Royal Enfield Shotgun 650 \n     Rs. 3.59 - 3.73 Lakh', 'assets/royal_enfield/img_6.webp'),
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