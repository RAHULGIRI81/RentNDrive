import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/User/User_Payment.dart';
import 'package:table_calendar/table_calendar.dart';
 // import the PaymentPage

class User_slot_booking extends StatefulWidget {
  final ValueChanged<DateTime> onBookingConfirmed;

  const User_slot_booking({super.key, required this.onBookingConfirmed});

  @override
  _User_slot_bookingState createState() => _User_slot_bookingState();
}

class _User_slot_bookingState extends State<User_slot_booking> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final List<DateTime> _bookedSlots = [];  // List to keep track of booked slots

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Slot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 01, 01),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (_bookedSlots.contains(day)) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        day.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (!_bookedSlots.contains(_selectedDay)) {
                    _bookedSlots.add(_selectedDay);
                  }
                });
                widget.onBookingConfirmed(_selectedDay);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(selectedDate: _selectedDay),
                  ),
                );
              },
              child: Text('Book Selected Date'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _bookedSlots.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Booked Date: ${_bookedSlots[index]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
