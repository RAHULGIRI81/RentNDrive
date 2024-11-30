import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_profile.dart';
import 'package:rent_me/RentNDrive/Owner/Owner%20Profile.dart';
import 'package:rent_me/RentNDrive/User/User_profile.dart';

class Admin_Profile_edit extends StatefulWidget {
  const Admin_Profile_edit({super.key});

  @override
  State<Admin_Profile_edit> createState() => _Admin_Profile_editState();
}

class _Admin_Profile_editState extends State<Admin_Profile_edit> {
  // Email validation function
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const pattern = r'^[^@]+@[^@]+\.[^@]+$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    // Define a regex pattern for phone number validation
    String pattern = r'^\+?0[1-9]\d{9,14}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final int? age = int.tryParse(value);
    if (age == null) {
      return 'Please enter a valid number';
    } else if (age < 0 || age > 120) {
      return 'Please enter an age between 0 and 120';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( title: Text('Edit Profile'), leading: IconButton( icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); }, ), ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Center(
              child: Stack(
                children: [ CircleAvatar(
                  radius: 60.r,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                  IconButton(onPressed: () {

                  }, icon: Padding(
                    padding: const EdgeInsets.only(top: 90,left: 70),
                    child: Icon(Icons.photo),
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Name",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Phone NO",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: validatePhoneNumber,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: '+1234567890',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Location",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: validateEmail,
                  decoration: InputDecoration(
                    labelText: 'Location',
                    hintText: 'Location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Age",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter your age',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: _validateAge,
                )
              ],
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_Profile(),));
            },
            child: Container(
              height: 60.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xFF416E29),
              ),
              child: Center(
                child: Text(
                  "Edit profile",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
