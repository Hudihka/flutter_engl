import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';
import 'package:english/Views/segment_control.dart';
import 'package:english/Views/list_words.dart';
import 'package:english/Views/switch_widget.dart';
import 'package:flutter/material.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          EnumTexts.title.getText(),
          textAlign: TextAlign.center,
          style: TextStyleExtension.generateSemibold(size: 23),
        ),
        backgroundColor: EnumColors.white.color(),
        shadowColor: EnumColors.clear.color(),
      ),
      body: Container(
        width: double.infinity,
        color: EnumColors.white.color(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            _segmentWidget(),
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            _switchWidget(),
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            const ListWords(),
          ],
        ),
      ),
    );
  }

  Widget _segmentWidget() {
    final widget = SegmentControl(
      index: 0,
    );
    widget.tapedSegment = ((int value) {
      print(value);
    });

    return widget;
  }

  Widget _switchWidget() {
    final widget = SwitchWidget(
      value: true,
    );
    widget.tapedSwitch = ((bool value) {
      print(value);
    });

    return widget;
  }
}
