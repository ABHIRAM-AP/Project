import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccountSection extends StatefulWidget {
  const UserAccountSection({super.key});

  @override
  State<UserAccountSection> createState() => _UserAccountSectionState();
}

class _UserAccountSectionState extends State<UserAccountSection> {
  final List<String> accountNumbers = ['12345', '98765', '13579'];
  String? selectedItem = '12345';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20),
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
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.white.withValues(alpha: 0.03),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color(0xFF222222),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.08),
                    blurRadius: 14,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  elevation: 8,
                  value: selectedItem,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  dropdownColor: Colors.black.withValues(alpha: 0.8),
                  items: [
                    ...accountNumbers.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                item,
                                style: GoogleFonts.urbanist(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.north_east,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    DropdownMenuItem(
                      value: 'ADD_NEW',
                      child: Row(
                        children: [
                          Text(
                            "Add New",
                            style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.add_circle_outline_sharp,
                              color: Colors.white),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ],
                  selectedItemBuilder: (BuildContext context) {
                    return accountNumbers.map<Widget>((String item) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item,
                          style: GoogleFonts.urbanist(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList()
                      ..add(
                        // For Add New, if selected (optional)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Add New",
                            style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                  },
                  onChanged: (String? newValue) {
                    if (newValue == 'ADD_NEW') {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Add New Account"),
                          content: TextField(
                            autofocus: true,
                            decoration:
                                InputDecoration(hintText: "Enter new account"),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  accountNumbers.add(value);
                                  selectedItem = value;
                                });
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      );
                    } else {
                      setState(() => selectedItem = newValue);
                    }
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
