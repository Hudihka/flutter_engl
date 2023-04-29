enum EnumTexts { title, all, favorit, hideTranslate, notWord, sections }

extension EnumTextsExtension on EnumTexts {
  String getText() {
    switch (this) {
      case EnumTexts.title:
        return 'Неправильные глаголы';
      case EnumTexts.all:
        return 'Все';
      case EnumTexts.favorit:
        return 'Фаворит';
      case EnumTexts.hideTranslate:
        return 'Скрыть перевод';
      case EnumTexts.notWord:
        return 'Нет слов';
      case EnumTexts.sections:
        return 'Секция';
    }
  }
}
