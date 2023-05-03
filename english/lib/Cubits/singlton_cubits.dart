import 'package:english/Cubits/group_cubit/group_cubit.dart';

class SingltonsCubit {
  SingltonsCubit._();
  static final SingltonsCubit shared = SingltonsCubit._();

  late GroupCubit _groupCubit;

  saveGroupCubit(GroupCubit cubit) {
    _groupCubit = cubit;
  }

  GroupCubit get getGroupCubit {
    return _groupCubit;
  }
}
