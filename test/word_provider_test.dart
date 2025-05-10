import 'package:flutter_test/flutter_test.dart';
import 'package:word_pair/word_provider.dart';

void main(){
  group('Test word Provider', (){
    final provider= WordProvider();
    test('Test if new word is generated', (){
      provider.init();
      expect(provider.newWord, isNotEmpty);
    });

    test('anew word ia dded and removed from the favorite list', (){
      provider.newWord = 'FruityLoops';
      provider.addToFavorite();
      expect(provider.favWordList.contains('FruityLoops'), true);
      provider.removeFromFavorite('FruityLoops');
      expect(provider.favWordList.contains('FruityLoops'), false);
    });
  });
}