import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking.dart';
import 'package:rent_me/main.dart';


class Owner_Booking_information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingInformationScreen(),
    );
  }
}

class BookingInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Information', style: TextStyle(fontSize: 24)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Status:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.green.shade900,
              ),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Confirmed',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Rental Period:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(),
            SizedBox(height: 16),
            Text(
              'Start Date & Time:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(),
            SizedBox(height: 16),
            Text(
              'End Date & Time:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(),
            SizedBox(height: 16),
            Text(
              'Payment:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.green.shade900,
              ),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Paid',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Customer Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Name:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(),
            SizedBox(height: 16),
            Text(
              'Phone:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(),
          ],
        ),
      ),
    );
  }
}
