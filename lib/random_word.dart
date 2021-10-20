import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RandomWord extends StatefulWidget {
  const RandomWord({Key? key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _styleText = const TextStyle(fontSize: 18.0);
  final _suggestion = <WordPair>[];
  final _saved = <WordPair>{};

  void _pushSaved() {
    final tiles = _saved.map((pair) => ListTile(
          title: Text(
            pair.asCamelCase,
            style: _styleText,
          ),
        ));

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(tiles: tiles, context: context).toList()
        : <Widget>[];
    Get.to(
      Scaffold(
        appBar: AppBar(
          title: const Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      ),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: _styleText,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          alreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Gernertor'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: 'Saved Suggestions',
          )
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  ListView _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return const Divider();
        }
        _suggestion.addAll(generateWordPairs().take(10));
        return _buildRow(_suggestion[index]);
      },
    );
  }
}
