import 'package:flutter/cupertino.dart';
import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';

class SegmentControl extends StatelessWidget {
  const SegmentControl({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              // setState(() {
              // groupValue = value;
              // });
            }),
      ),
    );
  }
}
