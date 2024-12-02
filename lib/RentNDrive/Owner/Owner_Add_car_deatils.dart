import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Login.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Navigation.dart';
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
  final TextEditingController rentController = TextEditingController();
  bool agreeToTerms = false;

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

  // Function to add car
  void addCar(BuildContext context) {
    if (formKey.currentState!.validate() && agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Car added successfully')),
      );
    } else if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the terms and privacy policy')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(appBar: AppBar(leading: IconButton(onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => Owner_Navigation(),)), icon: Center(child: Icon(Icons.arrow_back_ios))),title: Text(
        "ADD CAR",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),
      ),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
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
                          decoration: InputDecoration(
                            hintText: 'Gear Box',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          items: ['Automatic', 'Manual']
                              .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
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
                          decoration: InputDecoration(
                            hintText: 'Fuel',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          items: ['Petrol', 'Diesel', 'Electric']
                              .map((label) => DropdownMenuItem(
                            child: Text(label),
                            value: label,
                          ))
                              .toList(),
                          onChanged: (value) {},
                        ),
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
                        Text('Profile Picture:',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upload jpg'),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                         Text('Car Photos:',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Upload jpg'),
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
                        const Text('I agree to the Terms & Privacy policy'),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Owner_Add_car(),));
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
