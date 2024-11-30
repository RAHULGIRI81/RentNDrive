import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/User/User_feed_back.dart';
import 'package:rent_me/RentNDrive/User/User_privecy_policy.dart';
import 'package:rent_me/RentNDrive/User/User_profile.dart';
import 'package:rent_me/RentNDrive/pagemain.dart';

class User_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('User Name', style: TextStyle(color: Colors.white, fontSize: 24)),
            accountEmail: Text('user@example.com', style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with your image URL
            ),
            decoration: BoxDecoration(
              color: Color(0xFF4C7746),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => User_Profile(),)); // Close the drawer
              // Add navigation logic here
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.description),
            title: Text(
              'Privacy Policy',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => User_Privacy_Policy(),)); // Close the drawer
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text(
              'Feedback',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => User_feedback(),)); // Close the drawer
              // Add navigation logic here
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminApp(),)); // Close the drawer
              // Add logout functionality here
            },
          ),
        ],
      ),
    );
  }
}
