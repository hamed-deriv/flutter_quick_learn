import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_quick_learn/home_page.dart';
import 'package:flutter_quick_learn/states/dictionary_cubit.dart';
import 'package:flutter_quick_learn/word_repository.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Quick Learn',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocProvider(
          create: (context) => DictionaryCubit(WordRepository()),
          child: HomePage(),
        ),
      );
}
