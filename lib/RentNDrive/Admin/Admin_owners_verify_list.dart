import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owner_details.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owner_verify.dart';


class Admin_owners_verify_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome())),
        ),
        title: Text('Owner Verify'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('carDetails').where('State', isEqualTo: 0).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final carDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: carDetails.length,
            itemBuilder: (context, index) {
              final carDetail = carDetails[index];

              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Admin_owner_verify();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xFF4C7746),
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'Owner_Name: ${carDetail['OwnerName']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Phone: ${carDetail['OwnerPhone']}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
