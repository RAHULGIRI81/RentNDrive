import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Login.dart';
import 'package:rent_me/RentNDrive/User/User_login.dart';
import 'package:rent_me/main.dart';


class User_SignUp extends StatefulWidget {
  const User_SignUp({super.key});

  @override
  State<User_SignUp> createState() => _User_SignUpState();
}

class _User_SignUpState extends State<User_SignUp> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Validation functions
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // Sign-up function
  void signUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Add your sign-up logic here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-Up Successful')),
      );

      // Navigate to the Home Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>User_Login()),
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign up",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0, // Change this value to set the thickness when not focused
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0, // Change this value to set the thickness when not focused
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0, // Change this value to set the thickness when not focused
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
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),borderSide: BorderSide(color: Colors.black,style: BorderStyle.solid,width: 10)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0, // Change this value to set the thickness when not focused
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(color: Colors.black,
                            _obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword; // Toggle password visibility
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureConfirmPassword, // Use the state variable
                      validator: validateConfirmPassword,
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        return signUp(context);
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade800,
                        ),
                        child: Center(
                          child: Text(
                            "Sign up",
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/google.webp', // Replace with the actual image path
                              width: 20.0,
                            ),
                            SizedBox(width: 10.0),
                            Text('Continue with Google',style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.poppins(
                                color: Colors.black,fontWeight: FontWeight.bold
                            ),
                          ),
                          InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Owner_Login(),));
                          },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    )


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
