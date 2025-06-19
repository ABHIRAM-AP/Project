import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Graphs extends StatefulWidget {
  const Graphs({super.key});

  @override
  State<Graphs> createState() => _GraphsState();
}

class _GraphsState extends State<Graphs> {
  final List<FlSpot> cumulativePoints = [
    FlSpot(0, 0),
    FlSpot(1, 15),
    FlSpot(2, 20),
    FlSpot(3, 20),
    FlSpot(4, 20),
    FlSpot(5, 30),
    FlSpot(6, 35),
    FlSpot(7, 40),
    FlSpot(8, 45),
    FlSpot(9, 55),
    FlSpot(10, 60),
    FlSpot(11, 75),
  ];

  final List<FlSpot> benchmarkPoints = [
    FlSpot(0, 0),
    FlSpot(1, -20),
    FlSpot(2, -40),
    FlSpot(3, -65),
    FlSpot(4, -60),
    FlSpot(5, -50),
    FlSpot(6, -40),
    FlSpot(7, -30),
    FlSpot(8, -15),
    FlSpot(9, 0),
    FlSpot(10, 25),
    FlSpot(11, 45),
  ];

  final List<String> years = [
    '2023-02',
    '2023-04',
    '2023-06',
    '2023-08',
    '2023-10',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1.8,
        child: LineChart(
          LineChartData(
            minY: -80,
            maxY: 80,
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: false,
              // border: const Border(
              //   left: BorderSide(color: Colors.white24, width: 1),
              //   bottom: BorderSide(color: Colors.white24, width: 1),
              //   right: BorderSide.none,
              //   top: BorderSide.none,
              // ),
            ),
            titlesData: FlTitlesData(
              leftTitles: _buildLeftTitles(),
              bottomTitles: _buildBottomTitles(),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                spots: cumulativePoints,
                color: Colors.white,
                barWidth: 1.5,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                isCurved: true,
                spots: benchmarkPoints,
                color: const Color(0xFFA8A5FF),
                barWidth: 1.5,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            extraLinesData: ExtraLinesData(
              horizontalLines: [
                HorizontalLine(
                  y: 0,
                  color: Colors.white30,
                  strokeWidth: 1.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AxisTitles _buildBottomTitles() {
    return AxisTitles(
      axisNameWidget: Text(
        "Year",
        style: GoogleFonts.urbanist(fontSize: 10, color: Colors.white),
      ),
      sideTitles: SideTitles(
        showTitles: true,
        interval: 2,
        getTitlesWidget: (value, meta) {
          int index = (value / 2).round();
          if (index >= 0 && index < years.length) {
            return Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                years[index],
                style: GoogleFonts.urbanist(
                  fontSize: 8,
                  color: Colors.white,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  AxisTitles _buildLeftTitles() {
    return AxisTitles(
      axisNameWidget: Text(
        "Occurrences",
        style: GoogleFonts.urbanist(fontSize: 10, color: Colors.white),
      ),
      sideTitles: SideTitles(
        showTitles: true,
        interval: 20,
        reservedSize: 40,
        getTitlesWidget: (value, meta) {
          return Text(
            '${value.toInt()}%',
            style: GoogleFonts.urbanist(
              fontSize: 10,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
