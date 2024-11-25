import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Navigation.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_sign_up.dart';
import 'package:rent_me/main.dart';


class Owner_Login extends StatefulWidget {
  const Owner_Login({super.key});

  @override
  State<Owner_Login> createState() => _Owner_LoginState();
}

class _Owner_LoginState extends State<Owner_Login> {
  bool _obscurePassword = true;
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Email validation function
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const pattern =
        r'^[^@]+@[^@]+\.[^@]+$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Password validation function
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Login function
  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Add your login logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );

      // Navigate to the Home Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Owner_Navigation()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/CarBg.jpeg'), // Replace with the actual image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Log in",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.sp),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0.w, // Change this value to set the thickness when focused
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0.w, // Change this value to set the thickness when not focused
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2.0,color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0, // Change this value to set the thickness when focused
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0.w, // Change this value to set the thickness when not focused
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(color: Colors.black,
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword; // Toggle password visibility
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword, // Use the state variable
                  validator: validatePassword,
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    return login(context);
                  },
                  child: Container(
                    height: 50.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade800,
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Text(
                        "Dont have an account?",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Owner_SignUp(),));
                      },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                            color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: 2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.webp', // Replace with the actual image path
                          width: 20.0.w,
                        ),
                        SizedBox(width: 10.0.w),
                        Text('Continue with Google',style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
