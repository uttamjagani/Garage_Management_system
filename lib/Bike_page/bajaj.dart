// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Bajaj extends StatefulWidget {
  const Bajaj({super.key});

  @override
  State<Bajaj> createState() => _BajajState();
}

class _BajajState extends State<Bajaj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bajaj',
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
            buildImageContainer('Bajaj Pulsar 150 \n     Rs.1.04 - 1.14 Lakh', 'assets/bajaj/img_1.jpeg'),
            buildImageContainer('Bajaj Pulsar N250 \n        Rs.  1.38 - 1.5 Lakh', 'assets/bajaj/img_2.jpeg'),
            buildImageContainer('  Bajaj Avenger Cruise 220 \n           Rs.1.23 Lakh', 'assets/bajaj/img_3.webp'),
            buildImageContainer(' BajajPulsar NS160 \nRs.  1.1 - 1.35 Lakh', 'assets/bajaj/img_4.jpeg'),
            buildImageContainer('BajajAvenger Street 160\n     Rs.  1.01 Lakh', 'assets/bajaj/img_5.webp'),
            buildImageContainer('BajajPulsar F250  \n     Rs. 1.4 - 1.5 Lakh', 'assets/bajaj/img_6.webp'),
            buildImageContainer('BajajCT 125 X \n     Rs. 71,354 - 74,682', 'assets/bajaj/img_7.webp'),
            buildImageContainer('Bajaj Pulsar 220 F \n    Rs. 1.37 Lakh ', 'assets/bajaj/img_8.webp'),
            buildImageContainer('Bajaj Pulsar N150 \n   Rs. 1.17 Lakh ', 'assets/bajaj/img_9.webp'),
            buildImageContainer('Bajaj Dominar 400 \n    Rs. 2.29 Lakh ', 'assets/bajaj/img_10.webp'),
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