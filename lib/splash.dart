// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:gms/Authentication/auth.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _splashState();
}

class _splashState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                        "assets/Garage_icon.png"),
                  )),
                ),
              ),
              SizedBox(height: 15.0),
              Container(
                child: Text(
                  ' G M S ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
