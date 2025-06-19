import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/widgets/Profile/account_selector.dart';

class UserAccountSection extends StatefulWidget {
  const UserAccountSection({super.key});

  @override
  State<UserAccountSection> createState() => _UserAccountSectionState();
}

class _UserAccountSectionState extends State<UserAccountSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // For Title MT Account
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "MT Account",
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 26,
              height: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 30),
        // For Account Selecting using DropDown
        AccountSelector()
      ],
    );
  }
}
