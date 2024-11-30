import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_available_info.dart';
import 'package:rent_me/RentNDrive/User/User_Book_car.dart';
import 'package:rent_me/RentNDrive/User/User_Booking.dart';
import 'package:rent_me/RentNDrive/User/User_home.dart';
import 'package:rent_me/RentNDrive/User/User_liked_cars.dart';
import 'package:rent_me/RentNDrive/User/User_login.dart';

class User_navigation extends StatefulWidget {
  @override
  _User_navigationState createState() => _User_navigationState();
}

class _User_navigationState extends State<User_navigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    UserHome(),
    User_favrote(),
    User_booking(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white24, // Background color
        activeColor: Colors.black, // Active item color
        color: Colors.grey[900], // Inactive item color
        style: TabStyle.textIn, // Style of the convex bar
        items: const <TabItem>[
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.favorite, title: 'Favorite'),
          TabItem(icon: Icons.book_online, title: 'Booking'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
