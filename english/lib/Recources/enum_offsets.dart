enum EnumOffsets { offset6, offset8, offset13, offset16, offset24, offset50 }

extension EnumOffsetsExtension on EnumOffsets {
  double offset() {
    switch (this) {
      case EnumOffsets.offset6:
        return 6;
      case EnumOffsets.offset8:
        return 8;
      case EnumOffsets.offset13:
        return 13;
      case EnumOffsets.offset16:
        return 16;
      case EnumOffsets.offset24:
        return 24;
      case EnumOffsets.offset50:
        return 50;
    }
  }
}
