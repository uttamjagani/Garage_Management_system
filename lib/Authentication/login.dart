// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, unnecessary_import, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gms/Authentication/registartion.dart';
import 'package:gms/Manager/adminhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../User/navbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 254, 120, 83),
          title: Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.0),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: loginemailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Phone No.';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value)) {
                      return 'Enter valid Email Id';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Email Id',
                    prefixIcon: Icon(Icons.mail, color: Colors.black),
                    fillColor: Color.fromARGB(255, 255, 228, 228),
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: loginpasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Your Phone No.';
                    }
                    return null; 
                    // else if (!RegExp(
                    //         r'^(?=.*[A-Z])(?=.*[!@#$%^&*(),.?":{}|<>])(.{8,})$')
                    //     .hasMatch(value)) {
                    //   return 'Password atleast 8 character , 1 capital , 1 special symbol ';
                    // }
                    // return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Password',
                    prefixIcon:
                        Icon(Icons.remove_red_eye_sharp, color: Colors.black),
                    fillColor: Color.fromARGB(255, 255, 228, 228),
                    filled: true,
                  ),
                ),
                SizedBox(height: 26.0),
              
                ElevatedButton(
                  onPressed: () async{
                    if (_formkey.currentState!.validate()) {
                      var loginemail = loginemailController.text.trim();
                      var loginpassword = loginpasswordController.text.trim();

                      try {
                        var userSnapshot = await FirebaseFirestore.instance
                            .collection('user')
                            .where('UserEmaiId', isEqualTo: loginemail)
                            .get();
                        if (userSnapshot.docs.isNotEmpty) {
                          final User? firebaseUser = (await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                            email: loginemail,
                            password: loginpassword,
                          ))
                              .user;

                          if (firebaseUser != null) {
                            saveUserInformationLocally('user');
                            Fluttertoast.showToast(
                              msg: "Login Successfully",
                              backgroundColor: Colors.yellow,
                              textColor: Colors.black,
                            );
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationBarApp(),
                            ));
                          } else {
                            Fluttertoast.showToast(
                              msg: "User Not Found",
                              backgroundColor:  Color.fromARGB(255, 255, 59, 59),
                              textColor: Colors.black,
                            );
                          }
                        } else {
                          // Check if the user exists in the 'Admin' collection
                          var AdminSnapshot = await FirebaseFirestore.instance
                              .collection('Admin')
                              .where('AdminEmaiId', isEqualTo: loginemail)
                              .get();

                          if (AdminSnapshot.docs.isNotEmpty) {
                            final User? firebaseUser2 = (await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                              email: loginemail,
                              password: loginpassword,
                            ))
                                .user;

                            if (firebaseUser2 != null) {
                              saveUserInformationLocally2('Admin');

                              Fluttertoast.showToast(
                                msg: "Login Successfully",
                                backgroundColor: Colors.yellow,
                                textColor: Colors.black,
                              );
                              Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Admin_Home(),
                            ));
                            } else {
                              print("Check email & password.");
                            }
                          } else {
                            Fluttertoast.showToast(
                              msg: "User Not Found",
                              backgroundColor: Colors.yellow,
                              textColor: Colors.black,
                            );
                          }
                        }
                      } on FirebaseAuthException catch (e) {
                        Fluttertoast.showToast(
                          msg: "Login Failed !!",
                          backgroundColor: Colors.red,
                          textColor: Colors.black,
                        );
                        print("Error $e");
                      }
                      saveUserInfoLocally();
                    }
                  },
                    
                  child: Text('Login'),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Role_register(),
                            ));
                      },
                      child: Text(
                        " SignUp",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Replace this with your actual logic to save user information locally
  void saveUserInfoLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Username', 'John Doe');
  }
}

void saveUserInformationLocally(String userRole) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userRole', userRole);
}

void saveUserInformationLocally2(String userRole) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userRole', userRole);
}
