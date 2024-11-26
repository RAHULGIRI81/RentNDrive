import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_car_details.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking_info.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Navigation.dart';

class Admin_Total_Cars extends StatefulWidget {
  const Admin_Total_Cars({super.key});

  @override
  State<Admin_Total_Cars> createState() => _Admin_Total_CarsState();
}

class _Admin_Total_CarsState extends State<Admin_Total_Cars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Cars"),
        leading: IconButton(
          onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => AdminHome(),)),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Admin_Car_details();
                  },));
                },
                  child: Card(
                    margin: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF4C7746),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF4C7746), Colors.white],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "assets/Acura.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(child: Column(children: [
                                    Text('Aura')
                                  ],),), // Blank space
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Admin_Total_Cars();
                              }));
                            },
                            child: Container(
                              color: Color(0xFF4C7746),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Acura",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
