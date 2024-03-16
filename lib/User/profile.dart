// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  final String bookingId; // Booking ID passed from the Booking screen

  const Profile({Key? key, required this.bookingId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late Map<String, dynamic> bookingData = {};

  @override
  void initState() {
    super.initState();
    fetchBookingDetails();
  }

Future<void> fetchBookingDetails() async {
  try {
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Slot_Data')
        .doc(widget.bookingId) // Use the passed booking ID
        .get();

    setState(() {
      bookingData = documentSnapshot.data() as Map<String, dynamic>;
    });
  } catch (e) {
    print("Error fetching booking details: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Update Profile',
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
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Details:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Booking ID: ${widget.bookingId}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'City: ${bookingData['city']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Company: ${bookingData['company']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Model: ${bookingData['model']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Services: ${_formatSelectedServices(bookingData['services'])}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Extra Services: ${bookingData['extraServices']}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Date: ${_formatDate(bookingData['date'])}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatSelectedServices(dynamic services) {
    if (services == null) return "No services";

    List<String> serviceList = services.cast<String>();
    return serviceList.join(", ");
  }

  String _formatDate(dynamic date) {
    if (date == null) return "No date";

    return (date as Timestamp).toDate().toString();
  }
}
