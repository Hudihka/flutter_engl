import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english/Data/user_defaults.dart';

class Word {
  final String trans;
  final String form1;
  final String form2;
  final String form3;

  Word(
      {required this.trans,
      required this.form1,
      required this.form2,
      required this.form3});

  factory Word.fromJson(Map<String, dynamic> json) {
    final String trans = json['trans'] ?? "-";
    final String form1 = json['form1'] ?? "-";
    final String form2 = json['form2'] ?? "-";
    final String form3 = json['form3'] ?? "-";

    return Word(trans: trans, form1: form1, form2: form2, form3: form3);
  }

  static List<Word> generateArray(List<dynamic> jsonArray) {
    List<Word> words = [];
    for (var json in jsonArray) {
      words.add(Word.fromJson(json));
    }

    words.sort((obj1, obj2) {
      return obj1.trans.toLowerCase().compareTo(obj2.trans.toLowerCase());
    });

    return words;
  }

  String _idWord() {
    return "{$trans}_{$form1}";
  }

  bool isFavorit() {
    return Random().nextInt(100000000) / 2 == 0;
  }

  // Future<bool> isFavorit() {
  //   final ud = UserDefaults.shared;
  //   return ud.favoritThisWord(_idWord());
  // }
}
