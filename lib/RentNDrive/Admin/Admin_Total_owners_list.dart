import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owner_details.dart';

class Admin_Total_owners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UserListScreen extends StatelessWidget {
  Future<QuerySnapshot> _getOwnerDetails() async {
    return await FirebaseFirestore.instance
        .collection('carDetails')
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
          },
        ),
        title: Text('Owners'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _getOwnerDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No owners data found'));
          }

          final ownerDetails = snapshot.data!.docs;

          return ListView.builder(
            itemCount: ownerDetails.length,
            itemBuilder: (context, index) {
              final ownerDetail = ownerDetails[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Admin_owner_details(carId: ownerDetail.id,);
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xFF4C7746),
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.white),
                      title: Text(
                        'OwnerName: ${ownerDetail['OwnerName']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'OwnerPhone: ${ownerDetail['OwnerPhone']}',
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
