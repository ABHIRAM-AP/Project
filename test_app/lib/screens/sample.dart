import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/widgets/greeting.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF14161B),
      body: Center(
        child: Container(
          height: 280,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 20,
            color: Colors.white.withValues(alpha: 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: Colors.white.withValues(alpha: 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildVerifiedSection(),
                          const SizedBox(width: 14),
                          _profileIcon(),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const GreetingUser(
                        name: "Sam",
                        date: "Friday, September 13",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildVerifiedSection() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(70),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
      ),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05), // match glass color
          borderRadius: BorderRadius.circular(70),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.verified,
              color: Colors.blue,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              "Verified",
              style: GoogleFonts.urbanist(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _profileIcon() {
  return const CircleAvatar(
    radius: 25,
    backgroundImage: AssetImage('assets/images/user_pic.png'),
  );
}
