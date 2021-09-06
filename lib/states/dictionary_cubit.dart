import 'package:bloc/bloc.dart';

import 'package:flutter_quick_learn/states/dictionary_state.dart';
import 'package:flutter_quick_learn/word_repository.dart';
import 'package:flutter_quick_learn/word_response_model.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  DictionaryCubit(this.repository) : super(InitialState());

  final WordRepository repository;

  Future<void> search(String query) async {
    try {
      emit(SearchingState());

      List<WordResponseModel>? result =
          await repository.getWordsFromDictionary(query);

      result == null
          ? emit(ErrorState('$query not found!'))
          : emit(FetchedState(result));
    } on Exception catch (e) {
      emit(ErrorState('$e'));
    }
  }
}
