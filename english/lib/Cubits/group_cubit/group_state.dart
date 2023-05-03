part of 'group_cubit.dart';

@immutable
abstract class GroupState {}

class GroupContent extends GroupState {
  List<Group> listGroup;
  List<Group> listSelectedGroups;
  bool switchValue;
  int index;

  GroupContent(
      {required this.listGroup,
      required this.listSelectedGroups,
      required this.switchValue,
      required this.index});

  factory GroupContent.generateBase() {
    List<Group> listGroup = Content.generateAllGroupStart();

    return GroupContent(
        listSelectedGroups: const [],
        listGroup: listGroup,
        switchValue: true,
        index: 0);
  }

  GroupContent copyWith(
      {List<Group>? listGroup,
      List<Group>? listSelectedGroups,
      bool? switchValue,
      int? index}) {
    if (listGroup != null) {
      this.listGroup = listGroup;
    }

    if (listSelectedGroups != null) {
      this.listSelectedGroups = listSelectedGroups;
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
        listSelectedGroups: this.listSelectedGroups,
        listGroup: this.listGroup);
  }
}
