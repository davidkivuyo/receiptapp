import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/create_receipt_screen.dart';
import 'bottom_nav_bar.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  void _goToNewReceipt() {
    setState(() {
      _currentIndex = 2; // Index 2 points to CreateReceiptScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    // List of screens for bottom navigation
    final List<Widget> screens = [
      HomeScreen(onNewReceiptTap: _goToNewReceipt),
      const Center(child: Text("History Screen")), // Placeholder for History
      const CreateReceiptScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentIndex == 2 ? -1 : _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onNewReceiptTap: _goToNewReceipt,
      ),
    );
  }
}
