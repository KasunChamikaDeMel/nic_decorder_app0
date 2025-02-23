import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_screen.dart';
import 'result_screen.dart';

void main() {        // Main Entry
  runApp(MyApp());
}

class MyApp extends StatelessWidget {         // Root widget using getX for navigation
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NIC Decoder', theme: ThemeData(primarySwatch: Colors.blue), initialRoute: '/',         // Default screen
      getPages: [
        GetPage(name: '/', page: () => InputScreen()),         // Input Screen
        GetPage(name: '/result', page: () => ResultScreen()),        // Result screen
      ],
    );
  }
}
