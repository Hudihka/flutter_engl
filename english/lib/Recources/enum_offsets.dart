enum EnumOffsets { offset6, offset16 }

extension EnumOffsetsExtension on EnumOffsets {
  double offset() {
    switch (this) {
      case EnumOffsets.offset6:
        return 6;
      case EnumOffsets.offset16:
        return 16;
    }
  }
}
