import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Payment_details_list.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_cars.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_owners_list.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_users.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_details.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_verify_list.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_verify_details.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_drawer.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owners_verify_list.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_user_feedback.dart';

import 'nav.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Add this line to remove the debug banner
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_setting(),));
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
                radius: 50,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_Total_Cars();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.directions_car,
                      label: 'Total Cars',
                      value: '20',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_Total_users();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.person,
                      label: 'Total Users',
                      value: '20',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_user_payment_details();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.account_balance_wallet,
                      label: 'Payment',
                      value: '300',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_Total_owners();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.people,
                      label: 'Owners',
                      value: '15',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_Total_users_verify();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.verified_user,
                      label: 'Verify User',
                      value: '30',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Admin_owners_verify_list();
                        },
                      ));
                    },
                    child: DashboardCard(
                      icon: Icons.verified_user,
                      label: 'Verify Owner',
                      value: '12',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_FeedBack(),));
                },
                child: Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color(0xFF4C7746),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Row(
                      children: [
                        Icon(Icons.feedback, size: 40, color: Colors.white,),
                        Text(
                          "FeedBack",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  DashboardCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF4C7746),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              label,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
