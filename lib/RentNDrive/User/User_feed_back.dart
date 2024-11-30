import 'package:flutter/material.dart';
import 'package:rent_me/RentNDrive/User/User_Booking.dart';
import 'package:rent_me/RentNDrive/User/User_Navigation.dart';

void main() {
  runApp(User_feedback());
}

class User_feedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedbackScreen(),
    );
  }
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _commentController = TextEditingController();

  void _submitFeedback() {
    // Handle feedback submission logic
    final String comments = _commentController.text;
    print('Comments: $comments');
    // Clear the inputs
    _commentController.clear();
    // Display a thank you message
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Thank You!'),
          content: Text('Your feedback has been submitted.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => User_navigation(),));
      }, icon: Icon(Icons.arrow_back)),
        title: Text('User Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your comments here',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: Text('Submit Feedback',style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4C7746),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
