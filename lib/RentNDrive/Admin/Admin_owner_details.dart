import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_owners_list.dart';

class Admin_owner_details extends StatelessWidget {
  final String carId; // Add carId parameter

  Admin_owner_details({required this.carId});

  Future<DocumentSnapshot> _getOwnerDetail() async {
    return await FirebaseFirestore.instance.collection('carDetails').doc(carId).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Admin_Total_owners(),)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: _getOwnerDetail(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('No owner data found'));
            }

            final ownerDetail = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Table(
                    columnWidths: {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text('Owner Name: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['OwnerName'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Phone: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['OwnerPhone'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Vehicle Make: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['make'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Vehicle Model: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['model'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Year of Manufacture: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['year'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Gear Box: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['GearBox'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Fuel: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['Fuel'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Total Distance: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['distance'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Seat: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['seats'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Text('Rent: ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
                          Text(ownerDetail['rent'], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ],
                  ),





                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Profile:'),
                          SizedBox(width: 10),
                          Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Image.network(
                              ownerDetail['profile'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Photos:'),
                          SizedBox(width: 10),
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Image.network(
                              ownerDetail['carPhotos'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
