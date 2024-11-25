import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OwnerBookingInfo extends StatefulWidget {
  const OwnerBookingInfo({super.key});

  @override
  State<OwnerBookingInfo> createState() => _OwnerBookingInfoState();
}

class _OwnerBookingInfoState extends State<OwnerBookingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
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
                        child: Image.asset("assets/Acura.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Color(0xFF4C7746),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Acura",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),);
  }
}
