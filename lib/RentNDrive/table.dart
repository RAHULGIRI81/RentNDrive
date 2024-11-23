/*
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class BookingSystem extends StatefulWidget {
  @override
  _BookingSystemState createState() => _BookingSystemState();
}

class _BookingSystemState extends State<BookingSystem> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Set<DateTime> _bookedDates = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking System'),
      ),
      body: Column(
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
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                if (_bookedDates.contains(date)) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      '${date.day}',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _bookedDates.add(_selectedDay);
              });
            },
            child: Text('Book Selected Date'),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: _bookedDates
                  .map((date) => ListTile(
                        title: Text('${date.year}-${date.month}-${date.day}'),
                        trailing: Text('Not Available'),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
*/
