import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_owners_list.dart';

void main() {
  runApp(Admin_owner_details());
}

class Admin_owner_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VehicleDetailsPage(),
    );
  }
}

class VehicleDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Details'),leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Admin_Total_owners(),)),
        // Handle back button press
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Owner Name: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Rahul',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Phone: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('0000000000',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Vehicle Make: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Aura',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Vehicle Model: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('2024',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Year of Manufacture: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('2021',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Gear Box: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Automatic',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Fual: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('Petrol',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Total Distance: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('20003',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Seat: ',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text('5',style:TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
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
                      SizedBox(width: 10,),
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),child: Center(child: Icon(Icons.photo,size: 50,)),
                      ),
                    ],
                  ),

                  // Add profile picture here
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Photos:'),
                      SizedBox(width: 10,),
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),child: Center(child: Icon(Icons.photo_album,size: 50,)),
                      ),
                    ],
                  ),
                  // Add photos here
                ],
              ),

              SizedBox(height: 20),
              Text(
                'Approve or Edit the Rent: 15000',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
