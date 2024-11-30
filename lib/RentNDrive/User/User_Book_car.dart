import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/User/User_car_details.dart';
import 'package:rent_me/RentNDrive/User/User_verify.dart';

void main() {
  runApp(User_book_car());
}

class User_book_car extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDetailsScreen(),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => User_Car_details(),));
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date of birth',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone no',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 60,
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  // Handle scan license button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Scan your license', style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 400,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // Handle upload photo button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Upload your photo', style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => User_verify(),));
                  // Handle verify data button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C7746),
                ),
                child: Text(
                  'Verify your Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
