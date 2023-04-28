import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: EnumTexts.title.getText()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          widget.title,
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
            _segmentControl(),
            SizedBox(
              height: EnumOffsets.offset16.offset(),
            ),
            _switch(),
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

  Widget _segmentControl() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: EnumOffsets.offset16.offset()),
        child: CupertinoSlidingSegmentedControl<int>(
            backgroundColor: EnumColors.white.color(),
            thumbColor: EnumColors.black.color(),
            groupValue: 0,
            children: {
              0: Padding(
                padding: EdgeInsets.all(EnumOffsets.offset6.offset()),
                child: Text(
                  EnumTexts.all.getText(),
                  style: TextStyleExtension.generate(
                      style: EnumFontStyle.semiBold,
                      color: EnumColors.white,
                      size: 20),
                ),
              ),
              1: Padding(
                padding: EdgeInsets.all(EnumOffsets.offset6.offset()),
                child: Text(
                  EnumTexts.favorit.getText(),
                  style: TextStyleExtension.generate(
                      style: EnumFontStyle.semiBold,
                      color: EnumColors.black,
                      size: 20),
                ),
              )
            },
            onValueChanged: (value) {
              setState(() {
                // groupValue = value;
              });
            }),
      ),
    );
  }

  Widget _switch() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: EnumOffsets.offset16.offset()),
        child: Row(
          children: [
            CupertinoSwitch(
              value: true,
              activeColor: EnumColors.black.color(),
              onChanged: (bool? value) {
                setState(() {
                  // switchValue = value ?? false;
                });
              },
            ),
            SizedBox(
              width: EnumOffsets.offset16.offset(),
            ),
            Text(
              EnumTexts.hideTranslate.getText(),
              style: TextStyleExtension.generateSemibold(size: 20),
            )
          ],
        ),
      ),
    );
  }
}
