import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Edit_car_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Owner_cars_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String ownerId = FirebaseAuth.instance.currentUser?.uid ?? '';

    Stream<QuerySnapshot> _getOwnerCars() {
      return FirebaseFirestore.instance
          .collection('carDetails')
          .where('ownerId', isEqualTo: ownerId)
          .snapshots();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cars'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getOwnerCars(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No cars found'));
          }

          final cars = snapshot.data!.docs;

          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return ListTile(
                title: Text(car['make'] + ' ' + car['model']),
                subtitle: Text('Year: ' + car['year'].toString()),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Owner_edit_car_details(carId: car.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
