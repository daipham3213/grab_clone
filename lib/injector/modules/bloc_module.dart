import 'package:grab_clone/features/app/bloc/app_bloc.dart';
import 'package:grab_clone/injector/injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerLazySingleton<AppBloc>(
      () => AppBloc(
        appService: injector(),
        logService: injector(),
      ),
    );
  }
}
