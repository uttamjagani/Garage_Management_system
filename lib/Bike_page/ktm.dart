// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Ktm extends StatefulWidget {
  const Ktm({super.key});

  @override
  State<Ktm> createState() => _KtmState();
}

class _KtmState extends State<Ktm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KTM',
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
            buildImageContainer('    KTM 390 Duke \n     Rs. 3.10 Lakh ', 'assets/ktm/img_1.webp'),
            buildImageContainer('KTM 200 Duke \nRs. 1.96 Lakh ', 'assets/ktm/img_2.webp'),
            buildImageContainer('KTM 250 Duke \nRs. 2.39 Lakh', 'assets/ktm/img_3.webp'),
            buildImageContainer('KTM 125 Duke \nRs. 1.78 Lakh ', 'assets/ktm/img_4.webp'),
            buildImageContainer('KTM RC 200\nRs. 2.17 Lakh ', 'assets/ktm/img_5.webp'),
            buildImageContainer('KTM RC 390 \nRs. 3.18 Lakh ', 'assets/ktm/img_6.webp'),
            buildImageContainer('KTM RC 125\nRs. 1.89 Lakh ', 'assets/ktm/img_7.webp'),
            buildImageContainer('KTM 390 Adventure \nRs. 3.38 - 3.60 Lakh  ', 'assets/ktm/img_8.webp'),
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
