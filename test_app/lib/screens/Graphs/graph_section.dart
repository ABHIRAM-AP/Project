import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_app/widgets/Graphs/graphs.dart';
import 'package:test_app/widgets/Graphs/time_range.dart';

class GraphSection extends StatelessWidget {
  const GraphSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cumulative Returns vs Benchmark',
            style: GoogleFonts.urbanist(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildLegendDot(Colors.white),
              const SizedBox(width: 5),
              Text(
                "Cumulative Returns",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 20),
              _buildLegendDot(const Color(0xFFA8A5FF)),
              const SizedBox(width: 5),
              Text(
                "Benchmark",
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Graphs(),
          const SizedBox(height: 20),
          TimeRange(),
        ],
      ),
    );
  }
}

Widget _buildLegendDot(Color color) {
  return Container(
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
  );
}
