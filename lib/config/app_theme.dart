/// Creating custom color palettes is part of creating a custom app. The idea is to create
/// your class of custom colors, in this case `CompanyColors` and then create a `ThemeData`
/// object with those colors you just defined.
///
/// Resource:
/// A good resource would be this website: http://mcg.mbitson.com/
/// You simply need to put in the colour you wish to use, and it will generate all shades
/// for you. Your primary colour will be the `500` value.
///
/// Colour Creation:
/// In order to create the custom colours you need to create a `Map<int, Color>` object
/// which will have all the shade values. `const Color(0xFF...)` will be how you create
/// the colours. The six character hex code is what follows. If you wanted the colour
/// #114488 or #D39090 as primary colours in your theme, then you would have
/// `const Color(0x114488)` and `const Color(0xD39090)`, respectively.
///
/// Usage:
/// In order to use this newly created theme or even the colours in it, you would just
/// `import` this file in your project, anywhere you needed it.
/// `import 'path/to/theme.dart';`
import 'package:flutter/material.dart';

class AppThemes {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      // textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xff4caf50),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colorScheme.background,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: Colors.grey,
        elevation: 5,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      fontFamily: 'Sanomat',
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        // contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xff4caf50),
    primaryContainer: Color(0xFF66BB6A),
    secondary: Color(0xFFEF5350),
    secondaryContainer: Color(0xFFFF5252),
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF5F5F5),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFF4CAF50),
    primaryContainer: Color(0xFF66BB6A),
    secondary: Color(0xFFEF5350),
    secondaryContainer: Color(0xFFFF5252),
    background: Color(0xFF121212),
    surface: Color(0xFF212121),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );
  //
  // static const _regular = FontWeight.w400;
  // static const _medium = FontWeight.w500;
  // static const _semiBold = FontWeight.w600;
  // static const _bold = FontWeight.w700;
  //
  // static const TextTheme _textTheme = TextTheme(
  //   headlineMedium:
  //       TextStyle(fontWeight: _bold, fontSize: 20.0, fontFamily: 'Sanomat'),
  //   bodySmall:
  //       TextStyle(fontWeight: _semiBold, fontSize: 16.0, fontFamily: 'Sanomat'),
  //   headlineSmall:
  //       TextStyle(fontWeight: _medium, fontSize: 16.0, fontFamily: 'Sanomat'),
  //   titleMedium:
  //       TextStyle(fontWeight: _medium, fontSize: 16.0, fontFamily: 'Sanomat'),
  //   bodyLarge:
  //       TextStyle(fontWeight: _regular, fontSize: 16.0, fontFamily: 'Sanomat'),
  //   titleSmall:
  //       TextStyle(fontWeight: _medium, fontSize: 14.0, fontFamily: 'Sanomat'),
  //   bodyMedium:
  //       TextStyle(fontWeight: _regular, fontSize: 14.0, fontFamily: 'Sanomat'),
  //   titleLarge:
  //       TextStyle(fontWeight: _bold, fontSize: 16.0, fontFamily: 'Sanomat'),
  //   labelLarge:
  //       TextStyle(fontWeight: _semiBold, fontSize: 14.0, fontFamily: 'Sanomat'),
  //   labelSmall:
  //       TextStyle(fontWeight: _medium, fontSize: 12.0, fontFamily: 'Sanomat'),
  // );
}
