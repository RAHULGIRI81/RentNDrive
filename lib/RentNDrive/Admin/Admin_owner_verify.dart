import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_User_verify_list.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owners_verify_list.dart';

class Admin_owner_verify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarDetailsScreen(),
    );
  }
}

class CarDetailsScreen extends StatelessWidget {
  Future<DocumentSnapshot> _getCarDetail() async {
    // Assuming you want to filter documents where State is 0
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('carDetails')
        .where('State', isEqualTo: 0)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first; // Return the first document that meets the condition
    } else {
      throw Exception('No car data found');
    }
  }

  Future<void> _acceptStatus(BuildContext context, String carId) async {
    await FirebaseFirestore.instance.collection('carDetails').doc(carId).update({'State': 1});
    Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_owners_verify_list(),));
  }

  Future<void> _rejectStatus(BuildContext context, String carId) async {
    await FirebaseFirestore.instance.collection('carDetails').doc(carId).update({'State': 2});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Admin_Total_users_verify()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _getCarDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No car data found'));
          }

          final car = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Make: ${car['make']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Model: ${car['model']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Year: ${car['year']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Distance: ${car['distance']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Seats: ${car['seats']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Rent: ${car['rent']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Gear Box: ${car['GearBox']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Text('Fuel: ${car['Fuel']}', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text("Profile", style: TextStyle(fontSize: 16)),
                Image.network(
                  car['profile'],
                  height: 200,
                ),
                SizedBox(height: 16),
                Text("CarPhotos", style: TextStyle(fontSize: 16)),
                Image.network(
                  car['carPhotos'],
                  height: 200,
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => _acceptStatus(context, car.id),
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.green.shade900,
                          ),
                          child: Center(
                            child: Text(
                              'Accept',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                        onTap: () => _rejectStatus(context, car.id),
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.black, width: 2),
                            color: Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              'Reject',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
