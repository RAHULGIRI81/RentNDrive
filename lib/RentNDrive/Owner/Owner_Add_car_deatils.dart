import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Login.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Navigation.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Privacy_Policy.dart';
import 'package:rent_me/main.dart';

class Owner_Add_car_details extends StatefulWidget {
  const Owner_Add_car_details({super.key});

  @override
  State<Owner_Add_car_details> createState() => _Owner_Add_car_detailsState();
}

class _Owner_Add_car_detailsState extends State<Owner_Add_car_details> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController profileController = TextEditingController();
  final TextEditingController carphotosController = TextEditingController();
  final TextEditingController rentController = TextEditingController();
  bool agreeToTerms = false;
  String?_selected_item1;
  String?_selected_item2;

  // Validation functions
  String? validateYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the year of manufacture';
    }
    return null;
  }

  String? validateDistance(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the total distance';
    }
    return null;
  }

  String? validateSeats(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the number of seats';
    }
    return null;
  }

  String? validateRent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the rent rate';
    }
    return null;
  }


  Future<void> addCarDetails(BuildContext context) async {
    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You must agree to the privacy policy.", style: TextStyle(color: Colors.red))),
      );
      return;
    }

    if (makeController.text.isEmpty ||
        modelController.text.isEmpty ||
        yearController.text.isEmpty ||
        distanceController.text.isEmpty ||
        seatsController.text.isEmpty ||
        profileController.text.isEmpty ||
        carphotosController.text.isEmpty ||
        rentController.text.isEmpty ||
        _selected_item2 == null || _selected_item1 == null ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required.", style: TextStyle(color: Colors.red))),
      );
      return;
    }

    try {
      // Get current user ID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No user is currently signed in.")),
        );
        return;
      }

      // Fetch user data from Firestore
      DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      if (!userData.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User data not found.")),
        );
        return;
      }

      // Add car details including user data
      await FirebaseFirestore.instance.collection("carDetails").add({
        "make": makeController.text,
        "model": modelController.text,
        "year": yearController.text,
        "distance": distanceController.text,
        "seats": seatsController.text,
        "profile": profileController.text,
        "carPhotos": carphotosController.text,
        "rent": rentController.text,
        "GearBox": _selected_item1,
        "Fuel": _selected_item2,
        "OwnerName": userData['name'],
        "OwnerPhone": userData['phone'],
        "OwnerEmail": userData['email'],
        "OwnerId": user.uid,
        "State":0,
      });
      print("Data added successfully");
    } catch (e) {
      print("Failed to add data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add data")),
      );
      return;
    }

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Owner_Add_car();
      },
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Owner_Navigation(),
                  )),
              icon: Center(child: Icon(Icons.arrow_back_ios))),
          title: Text(
            "Add Car",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Vehicle Make",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: makeController,
                          decoration: InputDecoration(
                            hintText: 'Vehicle Make',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Vehicle Model",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: modelController,
                          decoration: InputDecoration(
                            hintText: 'Vehicle Model',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Year of Manufacture",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: yearController,
                          decoration: InputDecoration(
                            hintText: 'Year of Manufacture',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: validateYear,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Gear Box Type",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                value: _selected_item2,
                decoration: InputDecoration(
                  hintText: 'Gear Box',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                items: ['Automatic', 'Manual']
                    .map((label) => DropdownMenuItem(
                  child: Text(label),
                  value: label, // Assign label as the value
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selected_item2 = value; // Update state variable when selection changes
                  });
                },
              ),
            ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Fual Type",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                DropdownButtonFormField<String>(
                  value: _selected_item1,
                  decoration: InputDecoration(
                    hintText: 'Fuel',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  items: ['Petrol', 'Diesel', 'Electric', 'Hybrid']
                      .map((label) => DropdownMenuItem(
                    child: Text(label),
                    value: label,
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selected_item1 = value;
                    });
                  },
                )

                ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Total Distance Travel",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: distanceController,
                          decoration: InputDecoration(
                            hintText: 'Total Distance',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: validateDistance,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Number Of Seats",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: seatsController,
                          decoration: InputDecoration(
                            hintText: 'Number of Seats',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: validateSeats,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          'Profile Picture:',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: profileController,
                      decoration: InputDecoration(
                        labelText: 'Image Path',
                        hintText: 'Enter the image path or URL',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String imagePath = profileController.text;
                        print('Image path: $imagePath');
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          'Car Photos:',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: carphotosController,
                      decoration: InputDecoration(
                        labelText: 'Image Path',
                        hintText: 'Enter the image path or URL',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        String imagePath = carphotosController.text;
                        print('Image path: $imagePath');
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rent Rate",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: rentController,
                          decoration: InputDecoration(
                            hintText: 'Rent Rate',
                            prefixText: '\$',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          validator: validateRent,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Checkbox(
                          value: agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreeToTerms = value ?? false;
                            });
                          },
                        ),
                        Row(
                          children: [
                            const Text('I agree to the'), InkWell(onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Owner_Privacy_Policy(),));
                            },child: Text('Terms & Privacy policy',style: TextStyle(fontWeight:FontWeight.w600),)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        addCarDetails(context);
                      },
                      child: Container(
                        height: 60.h,
                        width: 400.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFF416E29),
                        ),
                        child: Center(
                          child: Text(
                            "Add Car",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
