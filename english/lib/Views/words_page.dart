import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';
import 'package:english/Views/segment_control.dart';
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
            const SegmentControl(),
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            const SwitchWidget(),
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
