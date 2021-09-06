import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'package:flutter_quick_learn/word_response_model.dart';

class WordPage extends StatelessWidget {
  const WordPage({required this.word, Key? key}) : super(key: key);

  final WordResponseModel word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Container(
          padding: EdgeInsets.all(32),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${word.word}',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '[${word.phonetics.first.text}]',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.white),
                    onPressed: () => AssetsAudioPlayer().open(
                      Audio.network(
                        'https:${word.phonetics.first.audio}',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: word.meanings.length,
                  itemBuilder: (context, index) {
                    final MeaningModel meaning = word.meanings[index];
                    final List<DefinitionModel> definitions =
                        meaning.definitions;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${meaning.partOfSpeech}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 8),
                        ListView.separated(
                          itemCount: definitions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Text(
                                'Definition: ${definitions[index].definition}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Example: ${definitions[index].example}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 24),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    height: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
