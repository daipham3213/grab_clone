import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:grab_clone/services/crashlytics_service/crashlytics_service.dart';

class FirebaseCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> init() async {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);
  }

  @override
  Future<void> recordException(dynamic exception, StackTrace? stack) {
    return FirebaseCrashlytics.instance.recordError(exception, stack);
  }
}
