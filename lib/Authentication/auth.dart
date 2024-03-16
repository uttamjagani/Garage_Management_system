// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Manager/adminhome.dart';
import '../User/navbar.dart';
import 'login.dart';

class AuthenticationWrapper extends StatefulWidget {
  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            // User is authenticated
            User? user = snapshot.data;
            if (user != null) {
              checkAndNavigateToHomeScreen(user);
            }
            return SizedBox.shrink(); // Returning an empty SizedBox
          } else {
            // User is not authenticated, show login screen
            return Login();
          }
        }
      },
    );
  }

  Future<void> checkAndNavigateToHomeScreen(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userRole = prefs.getString('userRole');

    if (userRole == 'user') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NavigationBarApp(),
        ),
      );
    } else if (userRole == 'Admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Admin_Home(),
        ),
      );
    }
  }
}
