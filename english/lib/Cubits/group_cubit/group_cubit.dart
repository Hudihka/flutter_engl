import 'package:bloc/bloc.dart';
import 'package:english/Data/group.dart';
import 'package:english/Data/user_defaults.dart';
import 'package:english/Data/word.dart';
import 'package:meta/meta.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final _ud = UserDefaults.shared;
  final GroupContent groupState;

  GroupCubit(this.groupState) : super(GroupInitial.generateBase());

  Future<void> fetchContent() async {
    final switchValue = await _ud.getSwitchValue();
    final segmentValue = await _ud.getSegmentIndex();

    final allGroup = Group.generateAllGroup();
    final allGroupFavorit = Group.generateAllGroupFavorit();

    emit(groupState.copyWith(
        listGroup: allGroup,
        listSelectedGroups: allGroupFavorit,
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
    final isFavorit = await word.isFavorit();
    await _ud.saveWord(word.idWord(), isFavorit);
    // получаем список всех груп
    final switchValue = await _ud.getSwitchValue();

    emit(groupState.copyWith(switchValue: switchValue));
  }
}
