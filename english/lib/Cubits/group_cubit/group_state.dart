part of 'group_cubit.dart';

@immutable
abstract class GroupState {}

class GroupInitial extends GroupState {
  List<Group> listWord;
  List<Group> listSelectedWords;
  bool switchValue;
  int index;

  GroupInitial(
      {required this.listWord,
      required this.listSelectedWords,
      required this.switchValue,
      required this.index});

  factory GroupInitial.generateBase() {
    List<Group> listWord = Group.generateAllGroup();
    List<Group> listSelectedWords = Group.generateAllGroupFavorit();

    return GroupInitial(
        listSelectedWords: listSelectedWords,
        listWord: listWord,
        switchValue: true,
        index: 0);
  }
}

class GroupContent extends GroupState {
  List<Word> listWord;
  List<Word> listSelectedWords;
  bool switchValue;
  int index;

  GroupContent(
      {required this.listWord,
      required this.listSelectedWords,
      required this.switchValue,
      required this.index});

  GroupContent copyWith(List<Word>? listWord, List<Word>? listSelectedWords,
      bool? switchValue, int? index) {
    if (listWord != null) {
      this.listWord = listWord;
    }

    if (listSelectedWords != null) {
      this.listSelectedWords = listSelectedWords;
    }

    if (switchValue != null) {
      this.switchValue = switchValue;
    }

    if (index != null) {
      this.index = index;
    }

    return GroupContent(
        index: this.index,
        switchValue: this.switchValue,
        listSelectedWords: this.listSelectedWords,
        listWord: this.listWord);
  }
}
