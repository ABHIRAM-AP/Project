import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeRange extends StatefulWidget {
  const TimeRange({super.key});

  @override
  State<TimeRange> createState() => _TimeRangeState();
}

class _TimeRangeState extends State<TimeRange> {
  int selectedTimeIndex = 0;
  final List<String> timeRanges = ["1D", "1W", "1M", "6M", "1Y", "Max"];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        timeRanges.length,
        (index) {
          return Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTimeIndex = index;
                  });
                },
                child: _timeRangeButton(
                  timeRanges[index],
                  selectedTimeIndex == index,
                ),
              ),
              if (index != timeRanges.length - 1) const SizedBox(width: 9),
            ],
          );
        },
      ),
    );
  }
}

Widget _timeRangeButton(String label, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color:
          isSelected ? Colors.white.withValues(alpha: 0.2) : Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected
            ? Colors.white.withValues(alpha: 0.2)
            : Colors.transparent,
        width: 1,
      ),
    ),
    child: Text(
      label,
      style: GoogleFonts.urbanist(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}
