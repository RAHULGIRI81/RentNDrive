import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner%20Profile.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Edit_car_details.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_FeedBack_page.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Privacy_Policy.dart';
import 'package:rent_me/main.dart';

class Owner_Settings extends StatefulWidget {
  const Owner_Settings({super.key});

  @override
  State<Owner_Settings> createState() => _Owner_SettingsState();
}

class _Owner_SettingsState extends State<Owner_Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( title: Text('Settings'), leading: IconButton( icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); }, ), ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70,right: 20,left: 20),
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
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Owner_Profile(),));},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF416E29),
              ),
              child: Text('Edit Profile',style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20.h),
            GestureDetector(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Owner_Edit_car_details();
              },));
            },
              child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Vehicle Details'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Owner_Privacy_Policy();
              },));
            },
              child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Owner_FeedBack();
              },));
            },
              child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2,),borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: Icon(Icons.feedback),
                  title: Text('feedBack'),
                  trailing: Icon(Icons.arrow_forward_ios),

                ),
              ),
            ),
            SizedBox(height: 200.h,),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
