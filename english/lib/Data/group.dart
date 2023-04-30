import 'package:english/Data/word.dart';

class Group {
  final int number;
  final String description;
  final List<Word> words;

  Group({required this.number, required this.description, required this.words});

  factory Group.fromJson(Map<String, dynamic> json) {
    final int number = json['number'] ?? 0;
    final String description = json['description'] ?? "-";

    final List<dynamic> jsonArray = json['array'] ?? [];
    final List<Word> words = Word.generateArray(jsonArray);

    return Group(number: number, description: description, words: words);
  }

  static List<Group> generateAllGroup(List<Map<String, dynamic>> contentJSON) {
    List<Group> groups = [];
    for (var json in contentJSON) {
      groups.add(Group.fromJson(json));
    }

    return groups;
  }
}
