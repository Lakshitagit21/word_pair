import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:word_pair/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('word pair app test', () {
    testWidgets('Word pair app flow test', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('START'), findsOneWidget);
      await tester.tap(find.text('START'));
      await tester.pump();

      final forwardButton = find.byIcon(Icons.arrow_forward);
      expect(forwardButton, findsOneWidget);

      for (int i = 0; i < 3; i++) {
        await tester.tap(forwardButton);
        await tester.pumpAndSettle(const Duration(seconds: 1));
        await tester.tap(find.byKey(const ValueKey('fav a word')));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.byKey(const ValueKey('snackbar_text')), findsOneWidget);
      }
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      for (int i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.delete).at(0));
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(find.text('Removed from favorites'), findsOneWidget);
      }
    });
  });
}
