import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:word_pair/word_provider.dart';

import 'favorite_word_list_page.dart';

class WordPairHome extends StatelessWidget {
  const WordPairHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Pairs'),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoriteWordListPage())),
            label: const Text('Favorites'),
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Consumer<WordProvider>(
          builder: (context, provider, child) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      provider.newWord,
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    if (provider.isFirst)
                      ElevatedButton(
                        onPressed: () {
                          provider.init();
                        },
                        child: const Text('START'),
                      ),
                    if (!provider.isFirst)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: provider.canGoBack
                                  ? () {
                                      provider.previous();
                                    }
                                  : null,
                              icon: const Icon(Icons.arrow_back),
                            ),
                            IconButton(
                              onPressed: () {
                                provider.next();
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                            IconButton(
                              onPressed: () {
                                provider.addToFavorite();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        key: const Key('snackbar_text'),
                                        '${provider.newWord} added to favorite'),
                                    duration: const Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.favorite,
                                key: Key('fav a word'),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              )),
    );
  }
}
