import 'package:flutter/material.dart';

import 'package:flutter_quick_learn/word_page.dart';
import 'package:flutter_quick_learn/word_response_model.dart';

class DefinitionsPage extends StatelessWidget {
  const DefinitionsPage({required this.result, Key? key}) : super(key: key);

  final List<WordResponseModel> result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
        itemCount: result.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            '${(index + 1).toString().padLeft(2, '0')}. ${result[index].word}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WordPage(word: result[index]),
            ),
          ),
        ),
        separatorBuilder: (context, index) => Divider(color: Colors.grey),
      ),
    );
  }
}
