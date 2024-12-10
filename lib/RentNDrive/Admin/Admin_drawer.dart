import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_profile.dart';
import 'package:rent_me/RentNDrive/Owner/Owner%20Profile.dart';
import 'package:rent_me/RentNDrive/Owner/jj.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_FeedBack_page.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Privacy_Policy.dart';
import 'package:rent_me/RentNDrive/pagemain.dart';
import 'package:rent_me/main.dart';

class Admin_setting extends StatefulWidget {
  const Admin_setting({super.key});

  @override
  State<Admin_setting> createState() => _Admin_settingState();
}

class _Admin_settingState extends State<Admin_setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.r,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Name',
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_Profile()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF416E29),
              ),
              child: Text(
                'Edit Profile',
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminApp(),));
                // Add logout functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
