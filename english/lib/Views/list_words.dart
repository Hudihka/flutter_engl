import 'package:flutter/cupertino.dart';
import 'package:english/Data/word.dart';
import 'package:english/Views/word_cell.dart';

class ListWords extends StatelessWidget {
  const ListWords({super.key});

  @override
  Widget build(BuildContext context) {
    List<Word> content = [];
    for (var i = 0; i < 16; i++) {
      Word word = Word(
          trans: "trans$i",
          form1: "form${i}1",
          form2: "form${i}2",
          form3: "form${i}3");
      content.add(word);
    }

    return Flexible(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: content.length,
            itemBuilder: (BuildContext context, int index) {
              return WordCell(word: content[index]);
            }));
  }
}
