import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_cars.dart';


class Admin_Car_details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Admin_Total_Cars();
            },));
            // Add back button functionality here
          },
        ),
        title: Text('Car details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/Acura.png', // Replace with the actual car image URL
                  height: 200,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Acura',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$15000/ Day (Without fuel)',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Photos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: List.generate(
                  3,
                      (index) => Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade300,
                    child: Center(child: Text('Photo ${index + 1}')),
                  ),
                )..add(
                  Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Technical Specification',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
          height: 600.0, // Set a fixed height for the GridView
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Gear Box',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('Automat',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.local_gas_station, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Fuel',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('Petrol',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.directions_car, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Model',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('2024',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.speed, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Mileage',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('2 Km',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.alt_route, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Distance',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('500',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.event_seat, size: 30.0),
                      SizedBox(height: 16.0),
                      Text('Seats',
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8.0),
                      Text('5',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          )
          ],
          ),
  ]),
      ),
      ));
  }}