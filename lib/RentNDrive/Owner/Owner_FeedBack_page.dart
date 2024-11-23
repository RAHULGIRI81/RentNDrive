import 'package:flutter/material.dart';

class Owner_FeedBack extends StatelessWidget {
  const Owner_FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Feedback'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            final feedback = [index];
            return Column(
              children: [
                FeedbackCard(
                  userName: 'Michael Johnson',
                  feedback: 'Had a small issue with the GPS, but overall a good experience.',
                  date: '2024-11-18',
                ),
                SizedBox(height: 16), // Add spacing between cards
              ],
            );
          },
        ),
      ),
    );
  }
}






class FeedbackCard extends StatelessWidget {
  final String userName;
  final String feedback;
  final String date;

  const FeedbackCard({
    required this.userName,
    required this.feedback,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                feedback,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
