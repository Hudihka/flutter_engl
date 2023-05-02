import 'package:english/Data/word.dart';
import 'package:english/Data/content_json.dart';

class Group {
  final int number;
  final String description;
  List<Word> words;

  Group({required this.number, required this.description, required this.words});

  factory Group.fromJson(Map<String, dynamic> json) {
    final int number = json['number'] ?? 1;
    final String description = json['description'] ?? "-";

    final List<dynamic> jsonArray = json['array'] ?? [];
    final List<Word> words = Word.generateArray(jsonArray);

    return Group(number: number, description: description, words: words);
  }

  List<Word> onlyFavorit() {
    return words.where((element) => element.isFavorit).toList();
  }
}
