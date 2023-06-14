import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grab_clone/features/app/bloc/app_bloc.dart';
import 'package:grab_clone/features/main/view/main.dart';

class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (prev, next) => prev.isFirstUse != next.isFirstUse,
      builder: (context, state) {
        // TODO: implement intro page
        // final bool isFirstUse = state.isFirstUse;
        return const MainScreen();
      },
    );
  }
}
