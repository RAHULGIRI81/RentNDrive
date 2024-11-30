import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Home.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_Total_cars.dart';
import 'package:rent_me/RentNDrive/Admin/Admin_owner_verify.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Add_car_deatils.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Login.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_Booking.dart';
import 'package:rent_me/RentNDrive/Owner/Owner_sign_up.dart';
import 'package:rent_me/RentNDrive/User/User_Booking.dart';
import 'package:rent_me/RentNDrive/User/User_Navigation.dart';
import 'package:rent_me/RentNDrive/User/User_car_details.dart';
import 'package:rent_me/RentNDrive/User/User_home.dart';
import 'package:rent_me/RentNDrive/pagemain.dart';
import 'RentNDrive/Admin/Admin_Login.dart';
import 'firebase_options.dart';

// ...
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AdminApp()
      ),
      designSize:  Size(412,892),
    );
  }
}
