import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owners_verify_list.dart';

class Admin_Owner_Verify extends StatefulWidget {
  const Admin_Owner_Verify({super.key});

  @override
  State<Admin_Owner_Verify> createState() => _Admin_Owner_VerifyState();
}

class _Admin_Owner_VerifyState extends State<Admin_Owner_Verify> {
  // Variables to maintain the state of the checkboxes
  bool isProfilePhotosVerified = false;
  bool isRentApproved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Admin_owners_verify_list(),)),
      // Handle back button press
    ),
        title: Text('Verify Owner'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vehicle Make: Aura',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Vehicle Model: 2024',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Year of Manufacture: 2021',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Gear Box: Automatic',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Fuel: Petrol',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Total Distance: 20005 km',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                'Seat: 5',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Profile',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              // Placeholder for profile image
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.shade300,
                child: Center(child: Text('Profile Image Placeholder')),
              ),
              SizedBox(height: 20),
              Text(
                'Photos',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              // Placeholder for photos
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey.shade300,
                child: Center(child: Text('Photos Placeholder')),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isProfilePhotosVerified,
                    onChanged: (value) {
                      setState(() {
                        isProfilePhotosVerified = value!;
                      });
                    },
                  ),
                  Text(
                    'Verify Profile and Photos',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Approve or Edit the Rent:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Rent Rate',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),  // Adjusted to avoid overlap
              Row(
                children: [
                  Checkbox(
                    value: isRentApproved,
                    onChanged: (value) {
                      setState(() {
                        isRentApproved = value!;
                      });
                    },
                  ),
                  Text(
                    'Approve the Rent Rate',
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      "Verify The Details",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
