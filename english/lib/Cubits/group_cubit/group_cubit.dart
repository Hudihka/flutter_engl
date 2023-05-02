import 'package:bloc/bloc.dart';
import 'package:english/Data/group.dart';
import 'package:english/Data/user_defaults.dart';
import 'package:english/Data/word.dart';
import 'package:meta/meta.dart';

import '../../Data/content_json.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final _ud = UserDefaults.shared;
  final GroupContent groupState;

  GroupCubit(this.groupState) : super(GroupInitial.generateBase());

  Future<void> fetchContent() async {
    final switchValue = await _ud.getSwitchValue();
    final segmentValue = await _ud.getSegmentIndex();

    final content = await Content.generateContentWithFavorit();

    emit(groupState.copyWith(
        listGroup: content.allGroup,
        listSelectedGroups: content.allOnlyFavorit,
        switchValue: switchValue,
        index: segmentValue));
  }

  Future<void> tapedSegment(int index) async {
    await _ud.saveIndexSegment(index);
    final segmentValue = await _ud.getSegmentIndex();

    emit(groupState.copyWith(index: segmentValue));
  }

  Future<void> tapedSwitch(bool value) async {
    await _ud.saveSwitch(value);
    final switchValue = await _ud.getSwitchValue();

    emit(groupState.copyWith(switchValue: switchValue));
  }

  Future<void> tapedWord(Word word) async {
    final isFavoritNewValue = !word.isFavorit;
    final id = word.idWord();
    await _ud.saveWord(id, isFavoritNewValue);

    final content = Content.updateWordsFavorit(isFavoritNewValue, id);

    emit(groupState.copyWith(
        listGroup: content.allGroup,
        listSelectedGroups: content.allOnlyFavorit));
  }
}
