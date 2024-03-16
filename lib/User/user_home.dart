// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gms/Bike_page/bajaj.dart';
import 'package:gms/Bike_page/harley.dart';
import 'package:gms/Bike_page/hero_ele.dart';
import 'package:gms/Bike_page/honda.dart';
import 'package:gms/Bike_page/ktm.dart';
import 'package:gms/Bike_page/new_launch.dart';
import 'package:gms/Bike_page/royal_enfield.dart';
import 'package:gms/Bike_page/suzuki.dart';
import 'package:gms/Bike_page/tvs.dart';
import 'package:gms/Bike_page/yamaha.dart';

class User_home extends StatefulWidget {
  const User_home({super.key});
  @override
  State<User_home> createState() => _User_homeState();
}

class _User_homeState extends State<User_home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'G M S',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //  _widgetOptions.elementAt(_selectedIndex),
                SizedBox(height: 20),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 160.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: [
                    buildCarouselItem('assets/stock-2.jpg'),
                    buildCarouselItem(
                      'assets/stock-3.jpg',
                    ),
                    buildCarouselItem(
                      'assets/stock-1.webp',
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                DotsIndicator(
                  dotsCount: 3,
                  position: _currentIndex.bitLength,
                  decorator: DotsDecorator(
                    color: Colors.grey[400]!,
                    activeColor: Colors.blue,
                  ),
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Bajaj()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/bajaj.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Tvs()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/tvs.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Honda()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/honda.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Yamaha()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/yamaha.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Royal_Enfield()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/royal_enfield.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Suzuki()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/suzuki.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Ktm()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/ktm.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Hero_ele()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/hero_ele.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Harley()),
                          );
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/harley.jpg',
                              width: 110.0,
                              height: 110.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 610.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                   // border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/opning.jpg',
                      width: 700.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => New_Launch()),
                      );
                    },
                    child: Text("New Lauch Bike")),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget buildCarouselItem(
    String imagePath,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Image.asset(
            imagePath,
            height: 170.0,
            width: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
