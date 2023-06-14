import 'package:grab_clone/injector/injector.dart';
import 'package:grab_clone/services/app_service/app_service.dart';
import 'package:grab_clone/services/app_service/app_service_impl.dart';
import 'package:grab_clone/services/crashlytics_service/crashlytics_service.dart';
import 'package:grab_clone/services/crashlytics_service/firebase_crashlytics.dart';
import 'package:grab_clone/services/log_service/console.dart';
import 'package:grab_clone/services/log_service/log_service.dart';
import 'package:grab_clone/services/storage_service/shared_preferences.dart';
import 'package:grab_clone/services/storage_service/storage_service.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerSingletonAsync<CrashlyticsService>(() async {
        var service = FirebaseCrashlyticsService();
        await service.init();
        return service;
      })
      ..registerFactory<LogService>(ConsoleLogService.new)
      ..registerSingleton<StorageService>(
          SharedPreferencesService(logService: injector()),
          signalsReady: true)
      ..registerSingleton<AppService>(
          AppServiceImpl(localStorageService: injector()));
  }
}
