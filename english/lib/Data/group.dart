import 'package:english/Data/word.dart';

class Group {
  final int number;
  final String description;
  final List<Word> words;

  Group({required this.number, required this.description, required this.words});

  factory Group.fromJson(Map<String, dynamic> json) {
    final int number = json['number'] ?? 0;
    final String description = json['description'] ?? "-";

    final List<Map<String, dynamic>> jsonArray = json['array'] ?? [];
    final List<Word> words = Word.generateArray(jsonArray);

    return Group(number: number, description: description, words: words);
  }
}
