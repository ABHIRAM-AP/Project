import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UtilTab extends StatefulWidget {
  const UtilTab({super.key});

  @override
  State<UtilTab> createState() => _UtilTabState();
}

class _UtilTabState extends State<UtilTab> {
  int selectedIndex = 0;

  final List<_UtilItemData> items = [
    _UtilItemData(
        iconPath: ('assets/images/user_icon.png'), label: "Dashboard"),
    _UtilItemData(iconPath: ('assets/images/home_icon.png'), label: "Strategy"),
    _UtilItemData(
        iconPath: ('assets/images/settings_icon.png'), label: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Color(0x5914161B)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = selectedIndex == index;
          return _buildUtilItem(
            iconPath: item.iconPath,
            label: item.label,
            isSelected: isSelected,
            onTap: () {
              setState(() => selectedIndex = index);
            },
          );
        }),
      ),
    );
  }
}

class _UtilItemData {
  final String iconPath;
  final String label;
  const _UtilItemData({required this.iconPath, required this.label});
}

Widget _buildUtilItem({
  required String iconPath,
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  final Color selectedColor = Color(0xFFA8A5FF);
  final Color unselectedColor = Color(0xFF636363);

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          decoration: isSelected
              ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: selectedColor.withAlpha(75),
                      blurRadius: 25,
                    ),
                  ],
                )
              : null,
          child: Image.asset(
            iconPath,
            width: 30,
            height: 30,
            color: isSelected ? selectedColor : unselectedColor,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          label,
          style: GoogleFonts.urbanist(
            color: isSelected ? selectedColor : unselectedColor,
            fontSize: 13,
          ),
        ),
      ),
    ],
  );
}
