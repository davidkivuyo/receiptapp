import 'package:flutter/material.dart';
import 'package:receiptapp/screens/create_receipt_screen.dart';
import '../navigation/bottom_nav_bar.dart';

// Data model for Recent Receipt Card
class ReceiptItem {
  final String id;
  final String name;
  final String tag;
  final String date;
  final String amount;
  final Color tagBgColor;
  final Color tagTextColor;

  ReceiptItem({
    required this.id,
    required this.name,
    required this.tag,
    required this.date,
    required this.amount,
    required this.tagBgColor,
    required this.tagTextColor,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0;

  final List<ReceiptItem> _receipts = [
    ReceiptItem(
      id: 'A437001',
      name: 'John Doe',
      tag: 'GOLD',
      date: '29 Jul 2026',
      amount: 'TZS 150k',
      tagBgColor: const Color(0xFFECEFF1),
      tagTextColor: const Color(0xFF37474F),
    ),
    ReceiptItem(
      id: 'A437002',
      name: 'Alice Mwangi',
      tag: 'COPPER',
      date: '28 Jul 2026',
      amount: 'TZS 85.4k',
      tagBgColor: const Color(0xFFEFEBE9),
      tagTextColor: const Color(0xFF4E342E),
    ),
    ReceiptItem(
      id: 'A437003',
      name: 'Bakari Hassan',
      tag: 'TANZANITE',
      date: '28 Jul 2026',
      amount: 'TZS 3.4M',
      tagBgColor: const Color(0xFFE8EAF6),
      tagTextColor: const Color(0xFF1A237E),
    ),
    ReceiptItem(
      id: 'A437004',
      name: 'Sarah James',
      tag: 'GOLD',
      date: '27 Jul 2026',
      amount: 'TZS 420k',
      tagBgColor: const Color(0xFFECEFF1),
      tagTextColor: const Color(0xFF37474F),
    ),
    ReceiptItem(
      id: 'A437005',
      name: 'Musa Ibrahim',
      tag: 'IRON ORE',
      date: '27 Jul 2026',
      amount: 'TZS 210k',
      tagBgColor: const Color(0xFFFBE9E7),
      tagTextColor: const Color(0xFFBF360C),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF0F57A6)),
          onPressed: () {},
        ),
        title: const Text(
          'Mineral Receipts',
          style: TextStyle(
            color: Color(0xFF0F57A6),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Daily Turnover Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF0052B4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 60,
                      color: Colors.white.withValues(alpha: 0.12),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Turnover',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'TZS 12.4M',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // New Receipt Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateReceiptScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  'New Receipt',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F57A6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Receipts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Color(0xFF0F57A6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Color(0xFF0F57A6),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Receipts List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _receipts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = _receipts[index];
                return _buildReceiptCard(item);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
        onNewReceiptTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateReceiptScreen()),
          );
        },
      ),
    );
  }

  Widget _buildReceiptCard(ReceiptItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ID & Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.id,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F57A6),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.name,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),

              // Tag & Date
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: item.tagBgColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          item.tag,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: item.tagTextColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.more_vert, color: Colors.grey.shade500, size: 20),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Amount
          Text(
            item.amount,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
