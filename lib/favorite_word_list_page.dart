import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pair/word_provider.dart';


class FavoriteWordListPage extends StatelessWidget {
  const FavoriteWordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: Consumer<WordProvider>(
        builder: (context, provider, child) =>
        provider.favWordList.isEmpty ? const Center(
          child: Text('No favorite words'),
        ) : ListView.builder(
          itemCount: provider.favWordList.length,
          itemBuilder: (context, index) {
            final word = provider.favWordList[index];
            return FavoriteWordItem(word: word, index: index);
          },
        ),
      ),
    );
  }
}

class FavoriteWordItem extends StatelessWidget {
  const FavoriteWordItem({super.key, required this.word, required this.index,});
  final String word;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word),
      trailing: IconButton(
        key: Key('btn_$index'),
        onPressed: () {
          context.read<WordProvider>().removeFromFavorite(word);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Removed from favorites'),
              duration: Duration(milliseconds: 500),
            ),
          );
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}



