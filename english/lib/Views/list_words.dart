import 'package:english/Cubits/singlton_cubits.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:flutter/cupertino.dart';
import 'package:english/Data/word.dart';
import 'package:english/Data/group.dart';
import 'package:english/Views/word_cell.dart';
import 'package:english/Views/heder_cell.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutter/material.dart';

class ListWords extends StatelessWidget {
  List<Group> content;
  bool hideContent;

  ListWords({super.key, required this.content, required this.hideContent});

  @override
  Widget build(BuildContext context) {
    return Flexible(child: _returnWidget(content));
  }

  Widget _returnWidget(List<Group> content) {
    if (content.isEmpty) {
      return Center(
        child: Text(
          EnumTexts.notWord.getText(),
          style:
              TextStyleExtension.generate(size: 25, style: EnumFontStyle.bold),
        ),
      );
    } else {
      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: content.length,
          itemBuilder: (BuildContext context, int index) {
            return StickyHeader(
              header: HederCell(group: content[index]),
              content: _listCells(words: content[index].words),
            );
          });
    }
  }

  Widget _listCells({required List<Word> words}) {
    List<Widget> list = [];
    for (var word in words) {
      final cell = WordCell(
        word: word,
        hideContent: hideContent,
      );
      cell.tapedWord = (Word word) {
        SingltonsCubit.shared.getGroupCubit.tapedWord(word);
      };

      list.add(cell);
    }

    return Column(
      children: list,
    );
  }
}
