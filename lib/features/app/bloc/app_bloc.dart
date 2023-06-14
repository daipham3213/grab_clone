import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grab_clone/config/config.dart';
import 'package:grab_clone/services/app_service/app_service.dart';
import 'package:grab_clone/services/log_service/log_service.dart';
import 'package:grab_clone/shared/ui_status.dart';
import 'package:grab_clone/utils/locale/locale.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AppService appService,
    required LogService logService,
  }) : super(const AppState()) {
    _appService = appService;
    _logService = logService;
    on<_Loaded>(_onLoaded);
    on<_DarkModeChanged>(_onDarkModeChanged);
    on<_LocaleChanged>(_onLocaleChanged);
    on<_DisableFirstUse>(_onDisableFirstUse);
  }

  late final AppService _appService;
  late final LogService _logService;

  FutureOr<void> _onLoaded(
    _Loaded event,
    Emitter<AppState> emit,
  ) {
    try {
      emit(
        state.copyWith(
          status: const UILoading(),
        ),
      );

      final bool darkMode = _appService.isDarkMode;
      final bool isFirstUse = _appService.isFirstUse;
      final String locale = _appService.locale;

      emit(
        state.copyWith(
          status: const UILoadSuccess(),
          isDarkMode: darkMode,
          isFirstUse: isFirstUse,
          locale: locale,
        ),
      );
    } catch (e, s) {
      _logService.error('AppBloc load failed', e, s);
      emit(
        state.copyWith(
          status: UILoadFailed(message: e.toString()),
        ),
      );
    }
  }

  FutureOr<void> _onDarkModeChanged(
    _DarkModeChanged event,
    Emitter<AppState> emit,
  ) async {
    final bool isDarkMode = !state.isDarkMode;
    await _appService.setIsDarkMode(darkMode: isDarkMode);
    emit(
      state.copyWith(
        isDarkMode: isDarkMode,
      ),
    );
  }

  FutureOr<void> _onLocaleChanged(
    _LocaleChanged event,
    Emitter<AppState> emit,
  ) async {
    if (state.locale != event.locale) {
      await AppLocale.delegate.load(Locale(event.locale));

      await _appService.setLocale(locale: event.locale);

      emit(
        state.copyWith(
          locale: event.locale,
        ),
      );
    }
  }

  FutureOr<void> _onDisableFirstUse(
    _DisableFirstUse event,
    Emitter<AppState> emit,
  ) async {
    if (state.isFirstUse) {
      await _appService.setIsFirstUse(isFirstUse: false);
      emit(
        state.copyWith(
          isFirstUse: false,
        ),
      );
    }
  }
}
