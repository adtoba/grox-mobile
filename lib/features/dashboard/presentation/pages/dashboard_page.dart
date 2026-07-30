import 'package:flutter/material.dart';
import 'package:grox/features/dashboard/presentation/widgets/bottom_navigation_bar.dart';
import 'package:grox/features/home/presentation/pages/home_page.dart';
import 'package:grox/features/p2p/presentation/pages/p2p_page.dart';
import 'package:grox/features/send/presentation/pages/send_page.dart';
import 'package:grox/features/wallet/presentation/pages/wallet_page.dart';

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
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomePage(),
          WalletPage(),
          SendPage(),
          P2PPage(),
          Container()
        ],
      ),
      bottomNavigationBar: PrimaryBottomNavigationBar(
        currentPage: currentPage,
        onPageChanged: onPageChanged
      ),
    );
  }
}