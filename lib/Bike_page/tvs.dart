// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Tvs extends StatefulWidget {
  const Tvs({super.key});

  @override
  State<Tvs> createState() => _TvsState();
}

class _TvsState extends State<Tvs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TVS',
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
            buildImageContainer('          TVS Raider \nRs. 95,219 - 1.02 Lakh', 'assets/tvs/img_1.jpeg'),
            buildImageContainer('TVS Apache RTR 160 \n Rs. 1.19 - 1.26 Lakh', 'assets/tvs/img_2.webp'),
            buildImageContainer('TVS Apache RTR 160 4V\n   Rs. 1.23 - 1.45 Lakh', 'assets/tvs/img_3.webp'),
            buildImageContainer('TVS Apache RTR 310 \n Rs. 2.42 - 2.63 Lakh ', 'assets/tvs/img_4.webp'),
            buildImageContainer('TVS Apache RR 310 \n     Rs. 2.72 Lakh ', 'assets/tvs/img_5.webp'),
            buildImageContainer('        TVS Ronin \nRs. 1.49 - 1.72 Lakh ', 'assets/tvs/img_6.webp'),
            
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
