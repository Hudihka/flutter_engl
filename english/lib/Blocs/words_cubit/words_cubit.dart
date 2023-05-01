import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'words_state.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit() : super(WordsInitial());
}
