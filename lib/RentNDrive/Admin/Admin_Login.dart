import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_me/main.dart';

import 'Admin_Home.dart';

class Admin_Login extends StatefulWidget {
  const Admin_Login({super.key});

  @override
  State<Admin_Login> createState() => _Admin_LoginState();
}

class _Admin_LoginState extends State<Admin_Login> {
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
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
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
        MaterialPageRoute(builder: (context) => AdminHome()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100,left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Log in",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'example@example.com',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                validator: validateEmail,
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    icon: Icon(
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
              InkWell(onTap: () {
                return login(context);
              },child: Container(height: 50,width: 300,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green.shade800),child: Center(child: Text("Log In",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),))
            ],
          ),
        ),
      ),
    );
  }
}
