import 'package:english/Data/group.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_colors.dart';
import 'package:flutter/material.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';

class HederCell extends StatelessWidget {
  HederCell({super.key, required this.group});

  Group group;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: EnumColors.black.color(),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: EnumOffsets.offset16.offset(),
              vertical: EnumOffsets.offset6.offset()),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  EnumTexts.sections.getText() + " " + group.number.toString(),
                  style: TextStyleExtension.generate(
                      size: 20,
                      style: EnumFontStyle.bold,
                      color: EnumColors.white),
                ),
              ),
              SizedBox(
                width: EnumOffsets.offset6.offset(),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.left,
                    group.description,
                    style: TextStyleExtension.generate(
                        size: 18,
                        style: EnumFontStyle.regular,
                        color: EnumColors.white),
                  ))
            ],
          ),
        ));
  }
}
