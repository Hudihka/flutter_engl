import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_images.dart';
import 'package:flutter/material.dart';
import 'package:english/Data/word.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';

class WordCell extends StatelessWidget {
  WordCell({super.key, required this.word, required this.showContent});

  Word word;
  bool showContent;

  late Function(Word) tapedWord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: EnumOffsets.offset50.offset(),
                width: EnumOffsets.offset50.offset(),
                child: IconButton(
                  padding: EdgeInsets.all(EnumOffsets.offset13.offset()),
                  icon: _generateImage(),
                  iconSize: EnumOffsets.offset24.offset(),
                  onPressed: () {
                    tapedWord(word);
                  },
                ),
              ),
            ),
            Padding(
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
                    height: EnumOffsets.offset8.offset(),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        "${word.form1} ${word.form2} ${word.form3}",
                        style: TextStyleExtension.generate(
                            size: 25,
                            style: EnumFontStyle.regular,
                            color: showContent
                                ? EnumColors.black
                                : EnumColors.clear),
                      ))
                ],
              ),
            ),
          ],
        ));
  }

  Image _generateImage() {
    return word.isFavorit()
        ? EnumImages.favorit.image()
        : EnumImages.not_favorit.image();
  }
}
