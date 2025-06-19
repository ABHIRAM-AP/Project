import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/screens/Tables/table_section.dart';
import 'package:test_app/utils/size_config.dart';
import 'package:test_app/widgets/Graphs/category_selector.dart';
import 'package:test_app/screens/Graphs/graph_section.dart';

import 'package:test_app/widgets/util_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategorySelector _navbar = CategorySelector();
  int selectedIndex = 0;
  final List<String> titles = ["Overview", "Return", "Risk", "Trades"];
  final List<String> iconPath = [
    'assets/images/menu-square_icon.png',
    'assets/images/money-send-circle_icon.png',
    'assets/images/security_icon.png',
    'assets/images/covariate_icon.png'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1A1B1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF14161B),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0, bottom: 7),
              child: Text(
                "Logo",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/mobile_menu');
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              titles.length,
              (index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: _navbar.buildTopNavBar(
                        titles[index],
                        iconPath[index],
                        selectedIndex == index,
                      ),
                    ),
                    if (index != titles.length - 1) const SizedBox(width: 10),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: SizeConfig.scaleHeight(20)),
          Expanded(
            child: ListView(
              children: [
                GraphSection(),
                SizedBox(height: 10),
                TableSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: UtilTab(),
    );
  }
}
