import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_verify_list.dart';

class Admin_user_verify_details extends StatelessWidget {
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
        leading: IconButton( onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_Total_users_verify(),)); }, icon: Icon(Icons.arrow_back), ),
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.green.shade900,
                      ),child: Center(child: Text('Accept',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.white),)),),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                      height: 40,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.black, width: 2),
                          color: Colors.grey),child: Center(child: Text('Reject',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),)),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
