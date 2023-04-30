import 'package:english/Data/word.dart';
import 'package:english/Data/content_json.dart';

class Group {
  final int number;
  final String description;
  List<Word> words;

  Group({required this.number, required this.description, required this.words});

  factory Group.fromJson(Map<String, dynamic> json) {
    final int number = json['number'] ?? 0;
    final String description = json['description'] ?? "-";

    final List<dynamic> jsonArray = json['array'] ?? [];
    final List<Word> words = Word.generateArray(jsonArray);

    return Group(number: number, description: description, words: words);
  }

  List<Word> onlyFavorit() {
    return words.where((element) => element.isFavorit()).toList();
  }

  static List<Group> generateAllGroup() {
    List<Group> groups = [];
    for (var json in contentJSON) {
      groups.add(Group.fromJson(json));
    }

    return groups;
  }

  static List<Group> generateAllGroupFavorit() {
    List<Group> groups = [];

    for (var json in contentJSON) {
      final group = Group.fromJson(json);
      final favorits =
          group.words.where((element) => element.isFavorit()).toList();
      if (favorits.isNotEmpty) {
        group.words = favorits;
        groups.add(group);
      }
    }

    return groups;
  }
}
