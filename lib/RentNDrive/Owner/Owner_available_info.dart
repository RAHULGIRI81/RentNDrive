import 'package:flutter/material.dart';

class OwnerBookingStatus extends StatelessWidget {
  // Example hardcoded booked dates
  final Set<DateTime> bookedDates = {
    DateTime(2024, 12, 1),
    DateTime(2024, 12, 5),
    DateTime(2024, 12, 12),
    DateTime(2024, 12, 20)
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> bookedDateTiles = [];
    for (DateTime date in bookedDates) {
      bookedDateTiles.add(
        Card(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${date.year}-${date.month}-${date.day}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Status: Not Available',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.event_busy,
                  color: Colors.red,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: bookedDateTiles,
        ),
      ),
    );
  }
}
