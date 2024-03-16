// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Suzuki extends StatefulWidget {
  const Suzuki({super.key});

  @override
  State<Suzuki> createState() => _SuzukiState();
}

class _SuzukiState extends State<Suzuki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suzuki',
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
            buildImageContainer('Suzuki Hayabusa \n  Rs. 16.90 Lakh', 'assets/suzuki/img_1.webp'),
            buildImageContainer('  Suzuki Gixxer SF \nRs. 1.40 - 1.45 Lakh', 'assets/suzuki/img_2.webp'),
            buildImageContainer('     Suzuki Gixxer \n Rs. 1.34 - 1.40 Lakh ', 'assets/suzuki/img_3.webp'),
            buildImageContainer('Suzuki Gixxer SF 250\n Rs. 1.92 - 2.05 Lakh', 'assets/suzuki/img_4.webp'),
            buildImageContainer('Suzuki V-Strom SX\n     Rs. 2.11 Lakh ', 'assets/suzuki/img_5.webp'),
            buildImageContainer('   Suzuki Gixxer 250 \n  Rs. 1.81 - 1.98 Lakh', 'assets/suzuki/img_6.webp'),
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
