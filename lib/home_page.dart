import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_quick_learn/definitions_page.dart';
import 'package:flutter_quick_learn/states/dictionary_cubit.dart';
import 'package:flutter_quick_learn/states/dictionary_state.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: BlocConsumer<DictionaryCubit, DictionaryState>(
        listener: (context, state) {
          if (state is FetchedState && state.result != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DefinitionsPage(result: state.result!),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is InitialState) {
            return _buildInputForm(context);
          } else if (state is SearchingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return _buildErrorWidget(state.message);
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildInputForm(BuildContext context) {
    final DictionaryCubit dictionaryCubit = context.watch<DictionaryCubit>();

    final TextEditingController editTextController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Spacer(),
          Text(
            'Dictionary App',
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Search any word you want',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 32),
          TextField(
            controller: editTextController,
            cursorColor: Colors.orangeAccent,
            decoration: InputDecoration(
              hintText: 'Search a word',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orangeAccent),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              prefixIcon: Icon(Icons.search, color: Colors.orangeAccent),
              hintStyle: TextStyle(color: Colors.black26),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                'SEARCH',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () => editTextController.text == ''
                  ? null
                  : dictionaryCubit.search(editTextController.text),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String errorMessage) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
