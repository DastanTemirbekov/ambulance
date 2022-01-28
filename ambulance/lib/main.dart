import 'package:ambulance/const/widgets/bottom_navigation.dart';
import 'package:ambulance/pages/profile/phone_number_screen.dart';
import 'package:ambulance/pages/profile/pin_code_screen.dart';
import 'package:ambulance/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey, primaryColor: Colors.white),
      routes: {
        '/': (context) => const BottomNavigation(),
        '/profile/phone_number': (context) => const PhoneNumberScreen(),
        '/profile/phone_number/pin_code_screen': (context) =>
            const PinCodeScreen()
      },
    );
  }
}
