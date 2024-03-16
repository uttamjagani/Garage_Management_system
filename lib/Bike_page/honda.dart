// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Honda extends StatefulWidget {
  const Honda({super.key});

  @override
  State<Honda> createState() => _HondaState();
}

class _HondaState extends State<Honda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Honda',
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
            buildImageContainer('    Honda SP 125 \nRs. 86,017 - 90,567', 'assets/honda/img_1.jpeg'),
            buildImageContainer('     Honda Shine \nRs. 79,800 - 83,800 ', 'assets/honda/img_2.webp'),
            buildImageContainer(' Honda Unicorn\n Rs. 1.09 Lakh', 'assets/honda/img_3.webp'),
            buildImageContainer('  Honda Hness CB350 \nRs. 2.09 - 2.16 Lakh ', 'assets/honda/img_4.webp'),
            buildImageContainer('    Honda Hornet 2.0 \n  Rs. 1.39 - 1.40 Lakh ', 'assets/honda/img_5.webp'),
            buildImageContainer('Honda Shine 100 \n     Rs. 64,900 ', 'assets/honda/img_6.webp'),
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
