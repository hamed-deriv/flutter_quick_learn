import 'dart:convert';

List<WordResponseModel> wordResponseModelFromJson(String string) =>
    List<WordResponseModel>.from(
      json.decode(string).map((item) => WordResponseModel.fromJson(item)),
    );

String wordResponseModelToJson(List<WordResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((item) => item.toJson())));

class WordResponseModel {
  WordResponseModel({
    required this.word,
    required this.phonetics,
    required this.meanings,
  });

  final String word;
  final List<PhoneticModel> phonetics;
  final List<MeaningModel> meanings;

  factory WordResponseModel.fromJson(Map<String, dynamic> json) =>
      WordResponseModel(
        word: json["word"],
        phonetics: List<PhoneticModel>.from(
          json["phonetics"].map((item) => PhoneticModel.fromJson(item)),
        ),
        meanings: List<MeaningModel>.from(
          json["meanings"].map((item) => MeaningModel.fromJson(item)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "phonetics": List<dynamic>.from(phonetics.map((item) => item.toJson())),
        "meanings": List<dynamic>.from(meanings.map((item) => item.toJson())),
      };
}

class MeaningModel {
  MeaningModel({required this.partOfSpeech, required this.definitions});

  final String partOfSpeech;
  final List<DefinitionModel> definitions;

  factory MeaningModel.fromJson(Map<String, dynamic> json) => MeaningModel(
        partOfSpeech: json["partOfSpeech"] ?? '',
        definitions: List<DefinitionModel>.from(
          json["definitions"].map((item) => DefinitionModel.fromJson(item)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions":
            List<dynamic>.from(definitions.map((item) => item.toJson())),
      };
}

class DefinitionModel {
  DefinitionModel({
    required this.definition,
    required this.example,
    required this.synonyms,
  });

  final String definition;
  final String example;
  final List<String>? synonyms;

  factory DefinitionModel.fromJson(Map<String, dynamic> json) =>
      DefinitionModel(
        definition: json["definition"] ?? '',
        example: json["example"] ?? '',
        synonyms: json["synonyms"] == null
            ? null
            : List<String>.from(json["synonyms"].map((item) => item)),
      );

  Map<String, dynamic> toJson() => {
        "definition": definition,
        "example": example,
        "synonyms": synonyms == null
            ? null
            : List<dynamic>.from(synonyms!.map((item) => item)),
      };
}

class PhoneticModel {
  PhoneticModel({required this.text, required this.audio});

  final String text;
  final String audio;

  factory PhoneticModel.fromJson(Map<String, dynamic> json) => PhoneticModel(
        text: json["text"] ?? '',
        audio: json["audio"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "audio": audio,
      };
}
