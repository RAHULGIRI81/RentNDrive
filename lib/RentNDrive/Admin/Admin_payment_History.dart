import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Payment_details_list.dart';


class Admin_user_payment_history extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionHistoryPage(),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),leading: IconButton(
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Admin_user_payment_details(),)),
        icon: Icon(Icons.arrow_back),
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Text('From: Rahul Giri',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                            Text('Phone NO',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 10),
                            Text('\$1000',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                            Text('✔ Complete', style: TextStyle(color: Colors.green,fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),

              SizedBox(height: 50,),
                      Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 3),borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center align the children vertically
                            crossAxisAlignment: CrossAxisAlignment.start, // Align the children to the start horizontally
                            children: [
                              Text('From Name:',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('John'),
                              SizedBox(height: 10),
                              Text('To Name:',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('rahul@kokicicici'),
                              SizedBox(height: 10),
                              Text('Date: 12/2003/25',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('12/2003/25'),
                              SizedBox(height: 10),
                              Text('Time: 05:02',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('05:02'),
                              SizedBox(height: 10),
                              Text('Transaction ID:',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text('asdsandcsmfdcdsmh'),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
