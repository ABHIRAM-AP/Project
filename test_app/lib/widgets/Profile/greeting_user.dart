import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingUser extends StatelessWidget {
  final String name;
  final String date;
  const GreetingUser({super.key, required this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello, $name!",
          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          date,
          style: GoogleFonts.urbanist(
            color: const Color(0xFF636363),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 2,
          ),
        ),
      ],
    );
  }
}
