import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';

class Admin_user_details extends StatelessWidget {
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
            onPressed: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => AdminHome(),)),
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Email:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Date of Birth:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Address:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Phone number:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('License:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Image.asset(
              "assets/Licence.jpg",
              height: 200,
            ),
            SizedBox(height: 16),
            Text('Photo:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Image.asset(
              "assets/person.png",
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
