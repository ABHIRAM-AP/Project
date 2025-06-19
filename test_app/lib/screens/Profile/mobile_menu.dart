import 'package:flutter/material.dart';
import 'package:test_app/screens/Profile/user_account_section.dart';
import 'package:test_app/widgets/Profile/profile_card.dart';
import 'package:test_app/widgets/Profile/gradient_divider.dart';
import 'package:test_app/widgets/util_tab.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu({super.key});

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF14161B),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context); // Goes to previous page
            } else {
              Navigator.popUntil(context,
                  (route) => route.isFirst); // Goes until first page is reached
            }
          },
        ),
      ),
      backgroundColor: const Color(0xFF14161B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 24,
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileCard(),
              GradientDivider(),
              const SizedBox(height: 30),
              UserAccountSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: UtilTab(),
    );
  }
}
