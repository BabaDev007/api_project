// To parse this JSON data, do
//
//     final words = wordsFromJson(jsonString);

import 'dart:convert';

List<Words> wordsFromJson(String str) => List<Words>.from(json.decode(str).map((x) => Words.fromJson(x)));

String wordsToJson(List<Words> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Words {
  String word;
  int score;
  List<String> tags;
  List<String>? defs;
  String? defHeadword;

  Words({
    required this.word,
    required this.score,
    required this.tags,
    this.defs,
    this.defHeadword,
  });

  factory Words.fromJson(Map<String, dynamic> json) => Words(
    word: json["word"],
    score: json["score"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    defs: json["defs"] == null ? [] : List<String>.from(json["defs"]!.map((x) => x)),
    defHeadword: json["defHeadword"],
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "score": score,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "defs": defs == null ? [] : List<dynamic>.from(defs!.map((x) => x)),
    "defHeadword": defHeadword,
  };
}
