import 'package:flutter/material.dart';
import 'package:test_app/screens/Graphs/graph_section.dart';
import 'package:test_app/screens/Tables/table_section.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(child: GraphSection()),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TableSection(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
