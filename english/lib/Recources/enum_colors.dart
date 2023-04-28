import 'package:flutter/material.dart';

enum EnumColors { white, black, clear }

extension EnumColorsExtension on EnumColors {
  Color color() {
    switch (this) {
      case EnumColors.white:
        return Colors.white;
      case EnumColors.black:
        return Colors.black;
      case EnumColors.clear:
        return const Color.fromARGB(0, 0, 0, 0);
    }
  }
}
