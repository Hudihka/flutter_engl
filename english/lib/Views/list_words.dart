import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:english/Data/word.dart';
import 'package:english/Data/group.dart';
import 'package:english/Views/word_cell.dart';
import 'package:english/Views/heder_cell.dart';
import 'package:grouped_list/grouped_list.dart';

class ListWords extends StatelessWidget {
  const ListWords({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Word> contentWord = [];

    // for (var i = 0; i < 8; i++) {
    //   Word word = Word(
    //       trans: "trans$i",
    //       form1: "form${i}1",
    //       form2: "form${i}2",
    //       form3: "form${i}3");
    //   contentWord.add(word);
    // }

    // List<Group> content = [
    //   Group(number: 1, description: "description 1", words: contentWord),
    //   Group(number: 2, description: "description 2", words: contentWord),
    //   Group(number: 3, description: "description 3", words: contentWord),
    //   Group(number: 4, description: "description 4", words: contentWord)
    // ];

    List _elements = [
      {'name': 'John', 'group': 'Team A'},
      {'name': 'Will', 'group': 'Team B'},
      {'name': 'Beth', 'group': 'Team A'},
      {'name': 'Miranda', 'group': 'Team B'},
      {'name': 'Mike', 'group': 'Team C'},
      {'name': 'Danny', 'group': 'Team C'},
    ];

    return Flexible(child: _returnWidget(_elements));
  }

  Widget _returnWidget(List content) {
    if (content.isEmpty) {
      return Center(
        child: Text(
          EnumTexts.notWord.getText(),
          style:
              TextStyleExtension.generate(size: 25, style: EnumFontStyle.bold),
        ),
      );
    } else {
      return GroupedListView<dynamic, dynamic>(
        elements: content,
        groupBy: (element) => element,
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (dynamic value) => Text("0001"),
        itemBuilder: (context, word) {
          return Text("0000");
        },
      );
    }
  }
}
