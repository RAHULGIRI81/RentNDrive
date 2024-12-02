import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final DateTime selectedDate;

  PaymentPage({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('Proceed with payment for booking on ${selectedDate.toLocal()}'),
      ),
    );
  }
}
