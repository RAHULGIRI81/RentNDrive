import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/User/User_Boong_Conformation.dart';

void main() {
  runApp(User_verify());
}

class User_verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerifiedScreen(),
    );
  }
}

class VerifiedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Verified',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => User_booking_conform(),));
                // Handle continue button press
              },
              style: ElevatedButton.styleFrom(
               backgroundColor:  Color(0xFF4C7746),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  fontSize: 18,color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
