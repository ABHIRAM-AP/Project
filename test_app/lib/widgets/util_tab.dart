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
        iconPath: ('assets/images/home_icon.png'), label: "Dashboard"),
    _UtilItemData(iconPath: ('assets/images/user_icon.png'), label: "Strategy"),
    _UtilItemData(
        iconPath: ('assets/images/settings_icon.png'), label: "Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 66,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: const Border(
          top: BorderSide(color: Colors.white12, width: 1.5),
        ),
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
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

  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
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
            width: 24,
            height: 24,
            color: isSelected ? selectedColor : unselectedColor,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.urbanist(
            color: isSelected ? selectedColor : unselectedColor,
            fontSize: 11,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: isSelected ? 1 : 0,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            width: 30,
            height: 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.8),
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: const Offset(1, -1),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
