import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class WordProvider with ChangeNotifier {
  List<String> favWordList = [];
  String newWord = '';
  String prevWord = '';

  void init() {
    newWord = _generateNewWordPair();
    notifyListeners();
  }

  String _generateNewWordPair() {
    return generateWordPairs().take(1).first.asPascalCase;
  }

  bool get isFirst => newWord.isEmpty && prevWord.isEmpty;
  bool get canGoBack => prevWord.isNotEmpty && newWord != prevWord;

  void next() {
    prevWord = newWord;
    newWord = _generateNewWordPair();
    notifyListeners();
  }

  void previous() {
    newWord = prevWord;
    notifyListeners();
  }

  void addToFavorite() {
    favWordList.add(newWord);
    notifyListeners();
  }

  void removeFromFavorite(String word) {
    favWordList.remove(word);
    notifyListeners();
  }
}