import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_details.dart';



class Admin_Total_users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
         onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => AdminHome(),)),
            // Handle back button press
        ),
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: 7, // Number of user profiles
        itemBuilder: (context, index) {
          return InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Admin_user_details();
            },));
          },
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Color(0xFF4C7746),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  'User_Name :',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Phone :',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}
