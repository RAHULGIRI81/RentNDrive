import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class User_booking_conform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RentalScreen(),
    );
  }
}

class RentalScreen extends StatefulWidget {
  @override
  _RentalScreenState createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  TextEditingController pickUpController = TextEditingController();
  TextEditingController dropOffController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  DateTime? pickUpDate;
  DateTime? dropOffDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(pickUpController, 'Pick-Up Location'),
            buildTextField(dropOffController, 'Drop-Off Location'),
            buildDatePickerField('Pick-Up Date', pickUpDate, (selectedDate) {
              setState(() {
                pickUpDate = selectedDate;
              });
            }),
            buildDatePickerField('Drop-Off Date', dropOffDate, (selectedDate) {
              setState(() {
                dropOffDate = selectedDate;
              });
            }),
            buildTextField(addressController, 'Address'),
            SizedBox(height: 20),
            Container(width: 400,height: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFF4C7746),),
                alignment: Alignment.center,
                child: Text(
                  'Continue to PAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurpleAccent),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget buildDatePickerField(String labelText, DateTime? date, Function(DateTime) onDatePicked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (selectedDate != null) {
            onDatePicked(selectedDate);
          }
        },
        child: AbsorbPointer(
          child: TextField(
            decoration: InputDecoration(
              labelText: date == null ? labelText : DateFormat('yyyy-MM-dd').format(date),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
