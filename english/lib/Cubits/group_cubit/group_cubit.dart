import 'package:bloc/bloc.dart';
import 'package:english/Data/group.dart';
import 'package:english/Data/user_defaults.dart';
import 'package:english/Data/word.dart';
import 'package:meta/meta.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final _ud = UserDefaults.shared;
  // final GroupState groupState;

  GroupCubit() : super(GroupInitial.generateBase());

  // Future<void> fetchContent() async {
  //   //показываем в начале пустой экран

  //   emit(userState.copyWith(
  //       listThemes: [], selectedTheme: [], allSelected: false, countWord: 0));

  //   final ids = await cash.idsWord;
  //   await _themeProvider.loadContent(ids);

  //   //грузим темы из памяти
  //   _listThemes = await cash.getAllThemes();

  //   var allCount = 0;
  //   for (var them in _listThemes) {
  //     allCount += them.listWord.length;
  //   }

  //   emit(userState.copyWith(
  //       listThemes: _listThemes,
  //       selectedTheme: [],
  //       allSelected: false,
  //       countWord: allCount));
  // }
}
