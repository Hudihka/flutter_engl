import 'package:flutter/material.dart';
import 'Views/Pages/words_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english/Cubits/group_cubit/group_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<GroupCubit>(
            create: (context) => GroupCubit(GroupContent.generateBase()),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(),
          home: WordsPage(),
        ));
  }
}
