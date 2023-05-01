import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_def_state.dart';

class UserDefCubit extends Cubit<UserDefState> {
  UserDefCubit() : super(UserDefInitial());
}
