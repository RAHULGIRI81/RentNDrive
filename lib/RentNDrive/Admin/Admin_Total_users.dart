import 'package:flutter/material.dart';



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
          onPressed: () {Navigator.pop(context);
            // Handle back button press
          },
        ),
        title: Text('User'),
      ),
      body: ListView.builder(
        itemCount: 7, // Number of user profiles
        itemBuilder: (context, index) {
          return Padding(
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
          );
        },
      ),
    );
  }
}
