import 'package:flutter/material.dart';

class GradientDivider extends StatefulWidget {
  const GradientDivider({super.key});

  @override
  State<GradientDivider> createState() => _GradientDividerState();
}

class _GradientDividerState extends State<GradientDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.transparent, //0
            Colors.white.withValues(alpha: 0.1), //.1
            Colors.white.withValues(alpha: 0.2), //.3
            Colors.white.withValues(alpha: 0.4), //.5
            Colors.white.withValues(alpha: 0.6), //.6
            Colors.white.withValues(alpha: 0.4), //.7
            Colors.white.withValues(alpha: 0.2), //.8

            Colors.transparent, //1.0
          ],
          stops: [0.0, 0.1, 0.3, 0.5, 0.6, 0.7, 0.9, 1.0],
        ),
      ),
    );
  }
}
