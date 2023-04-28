enum EnumOffsets { offset6, offset8, offset16 }

extension EnumOffsetsExtension on EnumOffsets {
  double offset() {
    switch (this) {
      case EnumOffsets.offset6:
        return 6;
      case EnumOffsets.offset8:
        return 8;
      case EnumOffsets.offset16:
        return 16;
    }
  }
}
