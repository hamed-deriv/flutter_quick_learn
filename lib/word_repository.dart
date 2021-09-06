import 'package:http/http.dart';

import 'package:flutter_quick_learn/http_service.dart';
import 'package:flutter_quick_learn/word_response_model.dart';

class WordRepository {
  Future<List<WordResponseModel>?> getWordsFromDictionary(String query) async {
    try {
      Response response = await HttpService.getResponse('en_US/$query');

      return response.statusCode == 200
          ? wordResponseModelFromJson(response.body)
          : null;
    } on Exception catch (e) {
      throw e;
    }
  }
}
