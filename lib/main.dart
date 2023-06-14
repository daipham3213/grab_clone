import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grab_clone/features/app/view/app.dart';
import 'package:grab_clone/injector/injector.dart';
import 'package:grab_clone/services/crashlytics_service/crashlytics_service.dart';
import 'package:grab_clone/services/log_service/log_service.dart';
import 'package:grab_clone/shared/app_observer.dart';
import 'package:logger/logger.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Logger.level = Level.info;
    if (kDebugMode) {
      Logger.level = Level.debug;
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setPreferredOrientations();

    Injector.init();
    await Injector.instance.allReady();

    Bloc.observer = AppBlocObserver();

    runApp(const App());
  }, (error, stack) {
    Injector.instance<CrashlyticsService>().recordException(error, stack);
    Injector.instance<LogService>().error('Error', error, stack);
  });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
