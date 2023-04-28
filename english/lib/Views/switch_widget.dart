import 'package:flutter/cupertino.dart';
import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                // setState(() {
                //   // switchValue = value ?? false;
                // });
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
