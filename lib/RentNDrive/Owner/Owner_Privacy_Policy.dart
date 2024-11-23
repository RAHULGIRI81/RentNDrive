import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/main.dart';

class Owner_Privacy_Policy extends StatefulWidget {
  const Owner_Privacy_Policy({super.key});

  @override
  State<Owner_Privacy_Policy> createState() => _Owner_Privacy_PolicyState();
}

class _Owner_Privacy_PolicyState extends State<Owner_Privacy_Policy> {
  final List<String> policyPoints = [
    "1. Vehicle Maintenance: Keep vehicles well-maintained and insured.",
    "2. Accurate Information: Provide up-to-date and precise details about vehicles.",
    "3. Availability Updates: Regularly update the vehicle's availability status.",
    "4. Rental Terms Compliance: Follow the platform’s standard rental terms and conditions.",
    "5. Vehicle Inspection: Inspect vehicles before and after each rental period.",
    "6. Commission: The platform retains 10% of the total rental amount as commission.",
    "7. Payout Schedule: Earnings are paid out bi-weekly or monthly.",
    "8. Cancellation Policy: Adhere to the platform’s cancellation policy.",
    "9. Disputes: Report disputes to the platform’s support team for resolution."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Privacy Policy',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: policyPoints.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                policyPoints[index],
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
