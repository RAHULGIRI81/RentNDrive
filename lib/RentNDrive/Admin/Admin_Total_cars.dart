import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking_info.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Navigation.dart';

class AdminTotalCars extends StatefulWidget {
  const AdminTotalCars({super.key});

  @override
  State<AdminTotalCars> createState() => _AdminTotalCarsState();
}

class _AdminTotalCarsState extends State<AdminTotalCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
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
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/Acura.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Container(), // Blank space
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return AdminTotalCars();
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
