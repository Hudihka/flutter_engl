import 'package:english/Recources/enum_colors.dart';
import 'package:english/Recources/enum_all_texts.dart';
import 'package:english/Recources/enum_font.dart';
import 'package:english/Recources/enum_offsets.dart';
import 'package:english/Views/segment_control.dart';
import 'package:english/Views/list_words.dart';
import 'package:english/Views/switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english/Cubits/group_cubit/group_cubit.dart';
import 'package:english/Cubits/singlton_cubits.dart';
import 'package:english/Data/group.dart';

class WordsPage extends StatelessWidget {
  late GroupCubit _contentCubit;

  late int _index;
  late bool _switchValue;
  late List<Group> _listGroup;

  @override
  Widget build(BuildContext context) {
    _contentCubit = context.read();

    SingltonsCubit.shared.saveGroupCubit(_contentCubit);

    return BlocBuilder<GroupCubit, GroupState>(builder: (context, state) {
      if (state is GroupContent) {
        _index = state.index;
        _switchValue = state.switchValue;
        _listGroup = _index == 0 ? state.listGroup : state.listSelectedGroups;
      }

      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              EnumTexts.title.getText(),
              textAlign: TextAlign.center,
              style: TextStyleExtension.generateSemibold(size: 23),
            ),
            backgroundColor: EnumColors.white.color(),
            shadowColor: EnumColors.clear.color(),
          ),
          body: Container(
            width: double.infinity,
            color: EnumColors.white.color(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: EnumOffsets.offset16.offset(),
                ),
                _segmentWidget(),
                SizedBox(
                  height: EnumOffsets.offset16.offset(),
                ),
                _switchWidget(),
                SizedBox(
                  height: EnumOffsets.offset16.offset(),
                ),
                ListWords(
                  content: _listGroup,
                  showContent: _switchValue,
                )
              ],
            ),
          ));
    });
  }

  Widget _segmentWidget() {
    final widget = SegmentControl(
      index: _index,
    );
    widget.tapedSegment = ((int value) {
      _contentCubit.tapedSegment(value);
    });

    return widget;
  }

  Widget _switchWidget() {
    final widget = SwitchWidget(
      value: _switchValue,
    );
    widget.tapedSwitch = ((bool value) {
      _contentCubit.tapedSwitch(value);
    });

    return widget;
  }
}
