import 'package:flutter_quick_learn/word_response_model.dart';

abstract class DictionaryState {}

class InitialState extends DictionaryState {}

class SearchingState extends DictionaryState {}

class FetchedState extends DictionaryState {
  FetchedState(this.result);

  final List<WordResponseModel>? result;
}

class ErrorState extends DictionaryState {
  ErrorState(this.message);

  final String message;
}
