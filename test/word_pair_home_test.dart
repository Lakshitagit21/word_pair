import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_pair/main.dart';

void main() {
  group('WordPairHome page test', () {
    testWidgets('Test if START button shows up', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('START'), findsOneWidget);
    });
    testWidgets(
        'Test if START button disappears after tapping it and back button shows up disabled ',
        (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('START'));
      await tester.pump();
      expect(find.text('START'), findsNothing);
      final buttonFinder = find.widgetWithIcon(IconButton, Icons.arrow_back);
      final backButton = tester.widget<IconButton>(buttonFinder);
      expect(backButton.onPressed, isNull);
    });
    testWidgets('test if snackbar text shows up when pressing favorite button', (tester) async{
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('START'));
      await tester.pump();
      await tester.tap(find.byKey(const ValueKey('fav a word')));
      await tester.pump();
      expect(find.byKey(const ValueKey('snackbar_text')), findsOneWidget);
    });

  });
}
