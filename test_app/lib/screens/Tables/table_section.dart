import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/utils/size_config.dart';

class TableSection extends StatefulWidget {
  const TableSection({super.key});

  @override
  State<TableSection> createState() => _TableSectionState();
}

class _TableSectionState extends State<TableSection> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  String selectedTab = "Periods";
  final List<Icon> navigationIcons = [
    const Icon(Icons.arrow_back_ios),
    const Icon(Icons.arrow_forward_ios),
  ];

  final List<List<String>> pages = [
    [
      "Total Trades (-10.74)",
      "Total Volume (-10.74)",
      "Average Holding Period (-10.74)",
      "Avg Loss / Avg Profit (-10.74)",
      "Profit Factor (-10.74)",
    ],
    [
      "Time in Market (-10.74)",
      "Sortino (-10.74)",
      "Smart Sharpe (-10.74)",
      "Smart Sortino (-10.74)",
      "Calmar (-10.74)",
    ],
    [
      "Treynor (-10.74)",
      "VaR (-10.74)",
      "cVaR (-10.74)",
      "Average Drawdown (10.74)",
      "Average DD length (-10.74)",
    ],
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _selectTab(String tab) {
    setState(() {
      selectedTab = tab;
      _currentPage = 0;
      _controller.jumpToPage(0);
    });
  }

  Widget _buildTablePages(List<List<String>> pages) {
    return PageView.builder(
      controller: _controller,
      itemCount: pages.length,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        final metrics = pages[index];
        return ListView.builder(
          itemCount: metrics.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, idx) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  metrics[idx],
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
            ),
            child: Row(
              children: [
                _buildTab("Periods"),
                const SizedBox(width: 20),
                _buildTab("Trading"),
              ],
            ),
          ),
          Container(
            width: SizeConfig.scaleHeight(370),
            height: SizeConfig.scaleHeight(340),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.02),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "All-time metrics",
                  style: GoogleFonts.urbanist(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                    height: SizeConfig.scaleHeight(220),
                    child: _buildTablePages(pages)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildNavigationButton(_previousPage, navigationIcons[0]),
                    const SizedBox(width: 10),
                    _buildNavigationButton(_nextPage, navigationIcons[1]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String tabName) {
    final bool isSelected = selectedTab == tabName;

    return GestureDetector(
      onTap: () => _selectTab(tabName),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tabName,
            style: GoogleFonts.urbanist(
              color: isSelected ? Colors.white : Colors.white54,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w400 : FontWeight.normal,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isSelected ? 1 : 0,
            child: Container(
              margin: const EdgeInsets.only(top: 6),
              width: 30,
              height: 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
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

  Widget _buildNavigationButton(VoidCallback onPressed, Icon icon) {
    return Container(
      height: 35,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: 1.5,
        ),
      ),
      child: IconButton(
        highlightColor: Colors.transparent,
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
        iconSize: 16,
      ),
    );
  }
}
