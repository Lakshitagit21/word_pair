import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:word_pair/favorite_word_list_page.dart';
import 'package:word_pair/main.dart';

void main(){
  group('Test favorite page', (){
    testWidgets('Test if favList is empty, text widget shows up', (tester) async{
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();
      expect(find.text('No favorite words'), findsOneWidget);
    });
    testWidgets('Test if favList is not empty, Listview shows up', (tester) async{
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('START'));
      await tester.pump();
      
      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      for(int i=0;i<5;i++){
        await tester.tap(find.byIcon(Icons.arrow_forward));
        await tester.pump();
       await tester.tap(find.byKey(const ValueKey('fav a word')));
        await tester.pump();
      }
      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(FavoriteWordItem), findsAtLeast(5));
    });
    
  });
}