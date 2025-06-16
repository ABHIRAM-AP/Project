import 'package:flutter/material.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/mobile_menu.dart';

// import 'package:test_app/screens/mobile_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/mobile_menu': (context) => MobileMenu(),
      },
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
