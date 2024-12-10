import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_car_details.dart';

class Admin_Total_Cars extends StatefulWidget {
  const Admin_Total_Cars({super.key});

  @override
  State<Admin_Total_Cars> createState() => _Admin_Total_CarsState();
}

class _Admin_Total_CarsState extends State<Admin_Total_Cars> {
  Future<QuerySnapshot> _getAcceptedCarDetails() async {
    return await FirebaseFirestore.instance
        .collection('carDetails')
        .where('State', isEqualTo: 1)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Cars"),

        leading: IconButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminHome(),
              )),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<QuerySnapshot>(
          future: _getAcceptedCarDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No car data found'));
            }

            final carDetails = snapshot.data!.docs;

            return ListView.builder(
              itemCount: carDetails.length,
              itemBuilder: (context, index) {
                final carDetail = carDetails[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),border:Border.all(color: Colors.grey),boxShadow: [ BoxShadow( color: Colors.white60.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: Offset(3, 3), ),]
                     /* gradient: LinearGradient(
                        colors: [Color(0xFF4C7746), Colors.white],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),*/
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    carDetail['profile'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        carDetail['make'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '\$${carDetail['rent']}/day',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(
                                            builder: (context) {
                                              return Admin_Car_details(carId: carDetail.id);
                                            },
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:  Color(0xFF4C7746),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text('View Details',style: TextStyle(color: Colors.white),),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
