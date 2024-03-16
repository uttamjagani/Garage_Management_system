// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gms/User/profile.dart';


class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController userinputbox = TextEditingController();
  String selectedValue = 'Surat';
  List<String> allOptions = [
    'default services',
    'Regular Maintenance',
    'Engine Services',
    'Electrical System Services',
    'Brake System Services',
    'Suspension Services',
    'Transmission and Clutch Services',
    'Exhaust System Services',
    'Cooling System Services',
    'Diagnostic and Troubleshooting',
    'Customization and Upgrades',
    'Bodywork and Paint',
    'Emergency Repairs',
  ];
  List<String> selectedServices = [];
  String selectedCompany = '';
  String selectedModel = '';
  String bookingId = ''; // The generated booking ID

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to generate random booking ID
  String generateBookingId() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(6, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  Future<void> _submitBooking() async {
    try {
      // Generate booking ID
      bookingId = generateBookingId();

      // Convert TimeOfDay to String
      String formattedTime = selectedTime.format(context);

      await _firestore.collection('Slot_Data').add({
        'bookingId': bookingId, // Add booking ID to Firestore
        'city': selectedValue,
        'company': selectedCompany,
        'model': selectedModel,
        'services': selectedServices,
        'extraServices': userinputbox.text,
        'date': selectedDate,
        'time': formattedTime, // Use the formattedTime String
      });

      Fluttertoast.showToast(
        msg: "Thank You !! Your Appointment Has Been Booked.",
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.black,
      );

      setState(() {
        // Trigger rebuild to update the app bar with new booking ID
      });

     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile(bookingId: bookingId)),
      );
    } catch (e) {
      print("Error adding booking: $e");
      // Handle the error as needed
    }
  }

  List<String> dropdowncities = ['Surat', 'Ahmedabad', 'Vadodara', 'Rajkot'];

  Map<String, List<String>> modelbycompany = {
    'Bajaj': [
      'Bajaj Pulsar 150',
      'Bajaj Pulsar 180',
      'Bajaj Pulsar 220F',
      'Bajaj Pulsar NS160',
      'Bajaj Pulsar NS200',
      'Bajaj Pulsar RS200',
      'Bajaj Dominar 250',
      'Bajaj Dominar 400',
      'Bajaj CT 100',
      'Bajaj CT 110',
      'Bajaj Platina 100',
      'Bajaj Platina 110',
      'Bajaj Avenger Street 160',
      'Bajaj Avenger Cruise 220',
      'Bajaj V15',
      'Bajaj Discover 110',
      'Bajaj Discover 125',
      'Bajaj Chetak Electric'
    ],
    'TVS': [
      'TVS Apache RR 310',
      'TVS Apache RTR 160',
      'TVS Apache RTR 180',
      'TVS Apache RTR 200 4V',
      'TVS Apache RTR 160 4V',
      'TVS Star City+',
      'TVS Radeon',
      'TVS Victor',
      'TVS Sport',
      'TVS Jupiter',
      'TVS NTORQ 125',
      'TVS Scooty Pep+',
      'TVS Scooty Zest 110',
      'TVS Scooty Streak',
    ],
    'Honda': [
      'Honda Activa 6G',
      'Honda Activa 125',
      'Honda Dio',
      'Honda Grazia',
      'Honda Aviator',
      'Honda CB Unicorn 160',
      'Honda CB Unicorn 150',
    ],
    'Yamaha': ['Manchester'],
    'Royal Enfield': ['Manchester'],
    'Suzuki': ['Manchester'],
    'KTM': ['Manchester'],
    'Hero Electric': ['Manchester'],
    'Harley Davidson': ['Manchester'],
    '': [''],
  };

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Booking',
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
            icon: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  size: 30,
                  color: Colors.black,
                ),
                if (bookingId
                    .isNotEmpty) // Display booking ID in notification badge
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        bookingId,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text(
                      ' Select City : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdowncities
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.white10,
                ),
                child: Row(
                  children: [
                    Text(
                      ' Select Company : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedCompany,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCompany = newValue!;
                          selectedModel = modelbycompany[selectedCompany]![0];
                        });
                      },
                      items: modelbycompany.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Colors.white12,
                ),
                child: Row(
                  children: [
                    Text(
                      ' Select model : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedModel,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedModel = newValue!;
                        });
                      },
                      items: modelbycompany[selectedCompany]!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Select Type of Services ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              for (String option in allOptions)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    color: Colors.white24,
                  ),
                  child: CheckboxListTile(
                    title: Text(option),
                    value: selectedServices.contains(option),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          selectedServices.add(option);
                        } else {
                          selectedServices.remove(option);
                        }
                      });
                    },
                  ),
                ),
              SizedBox(height: 5),
              TextFormField(
                controller: userinputbox,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Add Extra Services ',
                  prefixIcon: Icon(Icons.design_services, color: Colors.black),
                  fillColor: Colors.white30,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Select Date and Time for Appointment ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.3,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Selected Date: ${selectedDate.toLocal()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Selected Time : ${selectedTime.format(context)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submitBooking,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
