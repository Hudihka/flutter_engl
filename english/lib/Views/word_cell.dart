import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_images.dart';
import 'package:flutter/material.dart';
import 'package:english/Data/word.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';
import 'dart:async';

class WordCell extends StatefulWidget {
  Word word;
  bool showContent;

  late Function(Word) tapedWord;

  WordCell({super.key, required this.word, required this.showContent});

  @override
  _WordCellState createState() => _WordCellState();
}

class _WordCellState extends State<WordCell> {
  Timer? _timerClearButton;
  bool _showText = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("----------------------");
          if (widget.showContent == false) {
            _showText = !_showText;
            _actionTimer();
            setState(() {});
          }
        },
        child: SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
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
                            widget.word.trans,
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
                              "${widget.word.form1} ${widget.word.form2} ${widget.word.form3}",
                              style: TextStyleExtension.generate(
                                  size: 25,
                                  style: EnumFontStyle.regular,
                                  color: widget.showContent
                                      ? EnumColors.clear
                                      : EnumColors.black),
                            ))
                      ],
                    ),
                  ),
                ),
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
                        widget.tapedWord(widget.word);
                      },
                    ),
                  ),
                ),
              ],
            )));
  }

  Image _generateImage() {
    return widget.word.isFavorit
        ? EnumImages.favorit.image()
        : EnumImages.not_favorit.image();
  }

  _actionTimer() {
    if (_timerClearButton != null) {
      _timerClearButton?.cancel();
    }

    if (_showText) {
      //и если кнопки в данный момет показаны

      _timerClearButton = Timer(Duration(milliseconds: 1500), () {
        if (_showText) {
          //кнопки до сих пор видно
          _showText = false;
          setState(() {});
        }
      });
    }
  }
}
