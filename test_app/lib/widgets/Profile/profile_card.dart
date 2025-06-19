import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/widgets/Profile/greeting_user.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 20,
        color: Colors.white.withValues(alpha: 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
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
    );
  }
}

Widget _buildVerifiedSection() {
  return Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.04),
      borderRadius: BorderRadius.circular(70),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.3),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
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
  );
}

Widget _profileIcon() {
  return Row(
    children: [
      CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('assets/images/user_pic.png'),
      ),
      const SizedBox(width: 2),
      Icon(Icons.arrow_drop_down_rounded, size: 30, color: Color(0xFF636363))
    ],
  );
}
