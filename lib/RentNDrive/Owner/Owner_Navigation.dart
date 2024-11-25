import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking_info.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_available_info.dart';

class Owner_Navigation extends StatefulWidget {
  @override
  _Owner_NavigationState createState() => _Owner_NavigationState();
}

class _Owner_NavigationState extends State<Owner_Navigation> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    const Owner_Add_car(),
    const OwnerBookingInfo(),
    Owner_Available_info(),
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
        backgroundColor: Color(0xFF416E29), // Background color
        activeColor: Colors.white, // Active item color
        color: Colors.white, // Inactive item color
        items: const <TabItem>[
          TabItem(icon: Icons.grid_view, title: 'Home'),
          TabItem(icon: Icons.menu, title: 'Booking'),
          TabItem(icon: Icons.calendar_month_sharp, title: 'Avilability'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
