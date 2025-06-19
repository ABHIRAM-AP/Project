import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategorySelector {
  Widget buildTopNavBar(String title, String iconPath, bool isSelected) {
    return isSelected
        ? Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                  width: 1.5,
                )),
            child: buildCardNavbar(title, iconPath))
        : buildCardNavbar(title, iconPath);
  }

  Widget buildCardNavbar(String title, String iconPath) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Row(
        children: [
          Image.asset(
            iconPath,
          ),
          const SizedBox(width: 5),
          Text(
            title,
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 15.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
