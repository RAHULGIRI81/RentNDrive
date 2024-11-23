import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class Owner_Booking_info extends StatefulWidget {
  const Owner_Booking_info({super.key});

  @override
  State<Owner_Booking_info> createState() => _Owner_Booking_infoState();
}

class _Owner_Booking_infoState extends State<Owner_Booking_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Info'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CarCard(
                  imagePath: "assets/Acura.png",
                  brandName: 'Acura',
                ),
                CarCard(
                  imagePath: 'assets/Audi.png',
                  brandName: 'Audi',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String imagePath;
  final String brandName;

  CarCard({required this.imagePath, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Color(0xFF4C7746),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  brandName,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
