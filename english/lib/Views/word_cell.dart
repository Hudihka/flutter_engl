import 'package:flutter/cupertino.dart';
import 'package:english/Data/word.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';

class WordCell extends StatelessWidget {
  WordCell({super.key, required this.word});

  Word word;

  @override
  Widget build(BuildContext context) {
    List<Word> content = [];
    for (var i = 0; i < 10; i++) {
      Word word = Word(
          trans: "trans$i",
          form1: "form${i}1",
          form2: "form${i}2",
          form3: "form${i}3");
      content.add(word);
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: EnumOffsets.offset16.offset(),
            vertical: EnumOffsets.offset8.offset()),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                // textAlign: TextAlign.left,
                word.trans,
                style: TextStyleExtension.generate(
                    size: 25, style: EnumFontStyle.bold),
              ),
            ),
            SizedBox(
              width: EnumOffsets.offset8.offset(),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,
                  "${word.form1} ${word.form2} ${word.form3}",
                  style: TextStyleExtension.generate(
                      size: 25, style: EnumFontStyle.regular),
                ))
          ],
        ),
      ),
    );
  }
}
