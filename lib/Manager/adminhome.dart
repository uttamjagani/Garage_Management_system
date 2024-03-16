// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentication/login.dart';
import 'admin_bikes.dart';
import 'check_slot.dart';

class Admin_Home extends StatefulWidget {
  const Admin_Home({super.key});
  @override
  State<Admin_Home> createState() => _Admin_HomeState();
}

class _Admin_HomeState extends State<Admin_Home> {
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
              Icons.logout_outlined,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () async{
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              // Check the user role
              String userRole = sharedPreferences.getString('userRole') ?? '';

              // Sign out the user based on their role
              if (userRole == 'Admin') {
                // Remove user-related data from SharedPreferences
                sharedPreferences.remove('AdminEmaiId');

                // Sign out the user
                await FirebaseAuth.instance.signOut();
              } else if (userRole == 'user') {
                // Remove Admin-related data from SharedPreferences
                sharedPreferences.remove('UserEmaiId');

                // Sign out the Admin
                // Implement Admin sign-out logic if needed
                // Example: await policeAuth.signOut();
              }

              // Navigate to the login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
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
                    buildCarouselItem('assets/admin_banner1.jpg'),
                    buildCarouselItem(
                      'assets/admin_banner2.jpg',
                    ),
                    buildCarouselItem(
                      'assets/admin_banner3.jpg',
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

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Check_Slot()),
                    );
                  },
                  child: Container(
                    width: 300.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors
                          .amberAccent, // Change color to your desired background color
                      borderRadius: BorderRadius.circular(
                          20), // Adjust border radius as needed
                    ),
                    child: Center(
                      child: Text("Check Booking Slots",
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),

                SizedBox(height: 10.0),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin_Bikes()),
                    );
                  },
                  child: Container(
                    width: 300.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors
                          .amberAccent, // Change color to your desired background color
                      borderRadius: BorderRadius.circular(
                          20), // Adjust border radius as needed
                    ),
                    child: Center(
                      child: Text("Check New Bikes",
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),

                Container(
                  width: 610.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black, width: 0.5),
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
            height: 150.0,
            width: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
