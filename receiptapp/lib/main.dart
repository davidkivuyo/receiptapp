import 'package:flutter/material.dart';
import 'navigation/main_wraper.dart'; // Make sure to import your wrapper file

void main() {
  runApp(const MineralReceiptsApp());
}

class MineralReceiptsApp extends StatelessWidget {
  const MineralReceiptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mineral Receipts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F57A6)),
        useMaterial3: true,
      ),
      // Set MainWrapper as the home screen here:
      home: const MainWrapper(),
    );
  }
}
