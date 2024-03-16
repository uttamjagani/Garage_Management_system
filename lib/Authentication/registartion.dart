// ignore_for_file: unnecessary_null_comparison, body_might_complete_normally_nullable, use_key_in_widget_constructors, use_key_in_widget_constructors, duplicate_ignore, library_private_types_in_public_api, avoid_print, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unnecessary_new, avoid_unnecessary_containers, use_build_context_synchronously, unnecessary_import, non_constant_identifier_names, constant_identifier_names

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Role_register extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

enum UserRole {
  selectRole,
  user,
  Admin,
}

class _MyHomePageState extends State<Role_register> {
  UserRole selectedRole = UserRole.selectRole;
  final _formkey = GlobalKey<FormState>();
  bool _obsecuretext = true;
  TextEditingController AdminnameController = TextEditingController();
  TextEditingController AdminphoneController = TextEditingController();
  TextEditingController AdminidController = TextEditingController();
  TextEditingController AdminemailController = TextEditingController();
  TextEditingController AdminpassController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController userphoneController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  TextEditingController captchaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formkey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image(image: AssetImage('assets/Signup.png')),

                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButton<UserRole>(
                      value: selectedRole,
                      onChanged: (UserRole? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedRole = newValue;
                          });
                        }
                      },
                      items: [
                        DropdownMenuItem(
                          value: UserRole.selectRole,
                          child: Text('Select Role'),
                        ),
                        DropdownMenuItem(
                          value: UserRole.user,
                          child: Text('User'),
                        ),
                        DropdownMenuItem(
                          value: UserRole.Admin,
                          child: Text('Admin'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (selectedRole == UserRole.user)
                      userRegistrationWidget()
                    else if (selectedRole == UserRole.Admin)
                      AdminRegistrationWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userRegistrationWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            // Username field
            validator: (value) {
              if (value!.isEmpty) {
                return "Username is required";
              }
            },
            controller: usernameController,
            decoration: InputDecoration(
              label: Text("Username"),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
         
          SizedBox(
            height: 10,
          ),
          TextFormField(
            // Email field
            validator: (value) {
              if (value!.isEmpty) {
                return "Email is Required";
              }
            },
            controller: useremailController,
            decoration: InputDecoration(
              label: Text("Email"),
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            // Password field
            validator: (value) {
              if (value!.isEmpty) {
                return "Password is Required";
              } 
              // else if (!isPasswordValid(value)) {
              //   return "Password must be at least 8 characters and \n contain  at least one uppercase letter, \n one lowercase letter,\n one digit,\n and one special character.";
              //   // You can provide more specific error messages for different rules
              // }
              // return null; // Return null if the input is valid
            },
            obscureText: _obsecuretext,
            controller: userpasswordController,
            decoration: InputDecoration(
              label: Text("Password"),
              prefixIcon: Icon(Icons.security),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecuretext = !_obsecuretext;
                  });
                },
                icon: _obsecuretext
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async{
              if (_formkey.currentState!.validate()) {
                var username = usernameController.text.trim();
                var useremail = useremailController.text.trim();
                var userphone = userphoneController.text.trim();
                
                try {
                  // Create a new user in Firebase Authentication
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: useremail,
                    password: userpasswordController.text.trim(),
                  );

                  // Add user details to Firestore
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(userCredential.user?.uid)
                      .set({
                    "UserName": username,
                    "UserEmaiId": useremail,
                    "Userphone": userphone,
                  });

                  // Show success message
                  Fluttertoast.showToast(
                    msg: "Registration Successfully",
                    backgroundColor: Colors.yellow,
                    textColor: Colors.white,
                  );
                  

                  // Navigate to home screen
                 
                } catch (e) {
                  print("Error during registration: $e");
                  String errorMessage = "Registration Failed";
                  if (e is FirebaseAuthException) {
                    errorMessage = e.message ?? "An error occurred.";
                  }

                  // Show error message
                  Fluttertoast.showToast(
                    msg: errorMessage,
                    backgroundColor: Colors.redAccent,
                  );
                }
              }
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account ?  "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget AdminRegistrationWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Admin name is Required";
              }
            },
            controller: AdminnameController,
            decoration: InputDecoration(
              label: Text("Admin Name"),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
         
         
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Email is Required";
              }
            },
            keyboardType: TextInputType.emailAddress,
            controller: AdminemailController,
            decoration: InputDecoration(
              label: Text('Email'),
              prefixIcon: const Icon(
                Icons.email,
              ),
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Password is Required";
              }
              // else if (!isPasswordValid(value)) {
              //   return "Password must be at least 8 characters and \n contain  at least one uppercase letter, \n one lowercase letter,\n one digit,\n and one special character.";
              //   // You can provide more specific error messages for different rules
              // }
              // return null;
            },
            obscureText: _obsecuretext,
            controller: AdminpassController,
            decoration: InputDecoration(
              label: Text('Password'),
              prefixIcon: Icon(
                Icons.password,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obsecuretext = !_obsecuretext;
                  });
                },
                icon: _obsecuretext
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
              ),
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
         
         
          
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              if (_formkey.currentState!.validate()) {
                var pname = AdminnameController.text.trim();
                var pemail = AdminemailController.text.trim();
                var pphone = AdminphoneController.text.trim();
                try {
                  // Create a new user in Firebase Authentication
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: pemail,
                    password: AdminpassController.text.trim(),
                  );

                  // Add user details to Firestore
                  await FirebaseFirestore.instance
                      .collection('Admin')
                      .doc(userCredential.user?.uid)
                      .set({
                    "AdminName": pname,
                    "AdminEmaiId": pemail,
                    "Adminphone": pphone,
                  });

                  // Show success message
                  Fluttertoast.showToast(
                    msg: "Registration Successfully",
                    backgroundColor: Colors.yellow,
                    textColor: Colors.white,
                  );

                  // Navigate to home screen
                
                } catch (e) {
                  print("Error during registration: $e");
                  String errorMessage = "Registration Failed";
                  if (e is FirebaseAuthException) {
                    errorMessage = e.message ?? "An error occurred.";
                  }

                  // Show error message
                  Fluttertoast.showToast(
                    msg: errorMessage,
                    backgroundColor: Colors.redAccent,
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 20.0),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have An Account ?  "),
                GestureDetector(
                  onTap: () {
                    // Navigate to login page based on the selected role
                   Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  // bool isPasswordValid(String password) {
  //   if (password.length < 8) {
  //     return false;
  //   }

  //   // Password should contain at least one uppercase letter
  //   if (!password.contains(RegExp(r'[A-Z]'))) {
  //     return false;
  //   }

  //   // Password should contain at least one lowercase letter
  //   if (!password.contains(RegExp(r'[a-z]'))) {
  //     return false;
  //   }

  //   // Password should contain at least one digit
  //   if (!password.contains(RegExp(r'[0-9]'))) {
  //     return false;
  //   }

  //   // Password should contain at least one special character
  //   if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //     return false;
  //   }

  //   return true;
  // }

  bool isValidPhoneNumber(String phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return false;
    }

    // Check if the phone number contains only digits
    if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber)) {
      return false;
    }

    return true;
  }
}
