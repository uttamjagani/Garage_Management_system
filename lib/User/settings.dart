// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentication/login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _BookingState();
}

class _BookingState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
              Icons.logout,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () async{
              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();

              // Check the user role
              String userRole = sharedPreferences.getString('userRole') ?? '';

              // Sign out the user based on their role
              if (userRole == 'user') {
                // Remove user-related data from SharedPreferences
                sharedPreferences.remove('UserEmaiId');

                // Sign out the user
                await FirebaseAuth.instance.signOut();
              } else if (userRole == 'Admin') {
                // Remove Admin-related data from SharedPreferences
                sharedPreferences.remove('AdminEmaiId');

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}