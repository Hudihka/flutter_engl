enum EnumTexts { titleText, all, favorit, hideTranslate }

extension EnumTextsExtension on EnumTexts {
  String getText() {
    switch (this) {
      case EnumTexts.titleText:
        return 'Неправильные глаголы';
      case EnumTexts.all:
        return 'Все';
      case EnumTexts.favorit:
        return 'Фаворит';
      case EnumTexts.hideTranslate:
        return 'Скрыть перевод';
    }
  }
}
