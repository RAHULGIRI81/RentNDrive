import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car_deatils.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Settings.dart';
import 'package:rent_me/main.dart';

class Owner_Add_car extends StatefulWidget {
  const Owner_Add_car({super.key});

  @override
  State<Owner_Add_car> createState() => _Owner_Add_carState();
}

class _Owner_Add_carState extends State<Owner_Add_car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell( onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Owner_Settings();
        },));
      },child: CircleAvatar(backgroundImage: AssetImage("assets/profile.jpg"),radius: 70,)),
    ),),
        body: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              Container(
                  height: 200.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black,
                        width: 2.w), // Black border with width of 2
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Vechicle',
                        style: GoogleFonts.inriaSerif(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0), // Black border with width of 2
                          borderRadius: BorderRadius.circular(20), // Rounded corners
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return Owner_Add_car_details();
                          },));},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF416E29),
                            padding:
                                EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Add Car',
                            style: GoogleFonts.poppins(fontSize: 16.sp,color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
