import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grab_clone/config/app_config.dart';
import 'package:grab_clone/config/app_theme.dart';
import 'package:grab_clone/features/app/bloc/app_bloc.dart';
import 'package:grab_clone/features/splash/view/splash.dart';
import 'package:grab_clone/generated/l10n.dart';
import 'package:grab_clone/injector/injector.dart';
import 'package:grab_clone/shared/ui_status.dart';
import 'package:grab_clone/utils/routes/routes.dart';
import 'package:grab_clone/widgets/error_page.dart';
import 'package:grab_clone/widgets/loading_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = Injector.instance<AppBloc>()
      ..add(
        const AppEvent.loaded(),
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: _appBloc,
      child: BlocSelector<AppBloc, AppState, UIStatus>(
        bloc: _appBloc,
        selector: (state) => state.status,
        builder: (context, appStatus) {
          return appStatus.when(
            initial: () => const SplashScreen(),
            loading: () => const LoadingPage(),
            loadFailed: (_) => const ErrorPage(content: "App load failed"),
            loadSuccess: (_) => const _App(),
          );
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    final String locale = context.select(
      (AppBloc value) => value.state.locale,
    );

    final bool isDarkMode = context.select(
      (AppBloc value) => value.state.isDarkMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale(locale),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.darkThemeData,
      routerConfig: Routes.router,
      title: AppConfig.appTitle,
    );
  }
}
