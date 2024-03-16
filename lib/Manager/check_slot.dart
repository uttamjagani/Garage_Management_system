// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Check_Slot extends StatefulWidget {
  const Check_Slot({Key? key}) : super(key: key);

  @override
  State<Check_Slot> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Check_Slot> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late List<String> bookingIds = [];

  @override
  void initState() {
    super.initState();
    fetchBookingIds();
  }

  Future<void> fetchBookingIds() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Slot_Data').get();

      setState(() {
        bookingIds = querySnapshot.docs
            .map((doc) => doc['bookingId'].toString())
            .toList();
      });
    } catch (e) {
      print("Error fetching booking IDs: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Update Check_Slot',
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
            
            // Add decoration or other styles here
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('Slot_Data').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No data available');
                }

                final feedbackDocuments = snapshot.data!.docs;

                return Container( // Wrap ListView with Container
                  height: MediaQuery.of(context).size.height,
                  
                  width: 550, // Provide a height or use Expanded
                  child: ListView.builder(
                    itemCount: feedbackDocuments.length,
                    itemBuilder: (context, index) {
                      final BookingData =
                          feedbackDocuments[index].data() as Map<String, dynamic>;

                      final bookingid = BookingData['bookingId'] as String?;
                      final bookingcity = BookingData['city'] as String?;
                      final bookingcompany = BookingData['company'] as String?;
                      final bookingmodel = BookingData['model'] as String?;
                      final selectedServices = BookingData['services'] as List<dynamic>;
                      final extraservices = BookingData['extraServices'] as String?;
                      final date = BookingData['date'] as Timestamp;

                      // Format the Timestamp to a readable date string
                      final formattedDate = DateTime.parse(date.toDate().toString());

                      // Convert selectedServices to a comma-separated string
                      final selectedServicesString = selectedServices.join(", ");

                      return ListTile(
                        subtitle: Container(
                          width: 520,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bookind Id :$bookingid',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'City: $bookingcity',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Company: $bookingcompany',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Model: $bookingmodel',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Services: $selectedServicesString',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Extra Sevicies: $extraservices',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'Date: $formattedDate',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
