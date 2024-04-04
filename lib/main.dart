import 'package:bank_app_ui/nofification/home_page.dart';
import 'package:bank_app_ui/nofification/notification_controller.dart';
import 'package:bank_app_ui/screens/banking_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home:HomePage(),
    );
  }
}
