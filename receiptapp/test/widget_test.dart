import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:receiptapp/main.dart';

void main() {
  testWidgets('App renders with title', (WidgetTester tester) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.text('Mineral Receipts'), findsOneWidget);
    expect(find.text('TZS 12.4M'), findsOneWidget);
  });

  testWidgets('Shows New Receipt button and Recent Receipts header', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.text('New Receipt'), findsOneWidget);
    expect(find.text('Recent Receipts'), findsOneWidget);
    expect(find.text('View All'), findsOneWidget);
  });

  testWidgets('Renders all receipt cards with correct data', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.text('A437001'), findsOneWidget);
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('A437002'), findsOneWidget);
    expect(find.text('Alice Mwangi'), findsOneWidget);
    expect(find.text('A437003'), findsOneWidget);
    expect(find.text('Bakari Hassan'), findsOneWidget);
    expect(find.text('A437004'), findsOneWidget);
    expect(find.text('Sarah James'), findsOneWidget);
    expect(find.text('A437005'), findsOneWidget);
    expect(find.text('Musa Ibrahim'), findsOneWidget);
    expect(find.text('TZS 150k'), findsOneWidget);
    expect(find.text('TZS 85.4k'), findsOneWidget);
    expect(find.text('TZS 3.4M'), findsOneWidget);
    expect(find.text('TZS 420k'), findsOneWidget);
    expect(find.text('TZS 210k'), findsOneWidget);
  });

  testWidgets('Bottom navigation bar renders with tabs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('History'), findsOneWidget);
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    expect(find.byIcon(Icons.receipt_long_outlined), findsOneWidget);
    expect(find.byIcon(Icons.add), findsWidgets);
  });

  testWidgets('Tapping History nav item updates active state', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    await tester.tap(find.text('History'));
    await tester.pumpAndSettle();

    expect(find.text('History'), findsOneWidget);
  });

  testWidgets('Center add button is tappable', (WidgetTester tester) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    await tester.tap(find.byIcon(Icons.add).last);
    await tester.pump();

    expect(find.text('Mineral Receipts'), findsOneWidget);
  });

  testWidgets('Each receipt card shows more options icon and tags', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.byIcon(Icons.more_vert), findsNWidgets(5));
    expect(find.text('GOLD'), findsWidgets);
    expect(find.text('COPPER'), findsOneWidget);
    expect(find.text('TANZANITE'), findsOneWidget);
    expect(find.text('IRON ORE'), findsOneWidget);
  });

  testWidgets('Receipt cards show correct dates', (WidgetTester tester) async {
    await tester.pumpWidget(const MineralReceiptsApp());

    expect(find.text('29 Jul 2026'), findsOneWidget);
    expect(find.text('28 Jul 2026'), findsWidgets);
    expect(find.text('27 Jul 2026'), findsWidgets);
  });
}
