import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/User/User_Navigation.dart';
import 'package:rent_me/RentNDrive/User/User_dreawer.dart';



class user_booking_cancel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>User_navigation(),));
            // Handle back button press
          },
        ),
        title: Text('Booking'),
        actions: [
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () {
              // Handle phone button press
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Owner Information'),
                    content: Text('You can contact the owner at: \n\nPhone: +1-123-456-7890\nEmail: owner@example.com'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset("assets/Acura.png"),
            ),
            SizedBox(height: 20),
            Text(
              'Acura',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Cancel reason'),
            SizedBox(height: 10),
            TextField(maxLines: 9,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'reason',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle cancel booking button press
                },
                child: Text('Cancel Booking',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C7746),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
