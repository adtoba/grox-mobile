import 'package:flutter/material.dart';
import 'package:grox/features/dashboard/presentation/widgets/bottom_navigation_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  final pageController = PageController(
    initialPage: 0
  );
  
  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });

    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar: PrimaryBottomNavigationBar(
        currentPage: currentPage,
        onPageChanged: onPageChanged
      ),
    );
  }
}