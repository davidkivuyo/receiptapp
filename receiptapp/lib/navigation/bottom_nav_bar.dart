import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onNewReceiptTap;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onNewReceiptTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home Item
              Expanded(
                child: InkWell(
                  onTap: () => onTap(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: currentIndex == 0
                            ? const Color(0xFF0F57A6)
                            : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: currentIndex == 0
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: currentIndex == 0
                              ? const Color(0xFF0F57A6)
                              : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Center Action Button (Create Receipt Trigger)
              GestureDetector(
                onTap: onNewReceiptTap,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F57A6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),

              // History Item
              Expanded(
                child: InkWell(
                  onTap: () => onTap(1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        color: currentIndex == 1
                            ? const Color(0xFF0F57A6)
                            : Colors.grey.shade600,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'History',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: currentIndex == 1
                              ? FontWeight.w600
                              : FontWeight.normal,
                          color: currentIndex == 1
                              ? const Color(0xFF0F57A6)
                              : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
