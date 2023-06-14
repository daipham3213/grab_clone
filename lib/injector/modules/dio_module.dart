import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:grab_clone/config/app_config.dart';
import 'package:grab_clone/injector/injector.dart';

class DioModule {
  DioModule._();

  static const String dioInstanceName = 'dioInstance';
  static final GetIt _injector = Injector.instance;

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    /// Dio
    _injector.registerLazySingleton<Dio>(
          () {
        // TODO(boilerplate): custom DIO here
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
          ),
        );
        // if (!kReleaseMode) {
        //   dio.interceptors.add(
        //     PrettyDioLogger(
        //       requestHeader: true,
        //       requestBody: true,
        //       responseHeader: true,
        //       request: false,
        //     ),
        //   );
        // }
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}