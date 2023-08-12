import 'package:flutter/material.dart';
import 'package:flutter_search_doctor/main_layout.dart';
import 'package:flutter_search_doctor/screens/auth_page.dart';
import 'package:flutter_search_doctor/screens/booking_page.dart';
import 'package:flutter_search_doctor/screens/doctor_details.dart';
import 'package:flutter_search_doctor/screens/success_booked.dart';
import 'package:flutter_search_doctor/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//push navigator
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      initialRoute: '/',
      routes: {
        //initial route of the app
        //Auth Page register and login
        '/': (context) => const AuthPage(),
        //after login
        'main': (context) => const MainLayout(),
        'doc_detail': (context) => const DoctorDetail(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppointmentBooked()
      },
    );
  }
}
