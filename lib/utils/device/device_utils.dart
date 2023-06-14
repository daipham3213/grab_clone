import 'package:flutter/material.dart';

class DeviceUtils {
  /// Hide keyboard if it is showing
  ///
  /// [context] is the context of the widget
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  /// Get scaled size based on the screen orientation
  ///
  /// [context] is the context of the widget
  /// [scale] is the scale of the size
  static double getScaledSize(BuildContext context, double scale) =>
      scale *
      (MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height);

  /// Get scaled width based on the screen orientation
  ///
  /// [context] is the context of the widget
  /// [scale] is the scale of the width
  static double getScaledWidth(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.width;

  /// Get scaled height based on the screen orientation
  ///
  /// [context] is the context of the widget
  /// [scale] is the scale of the height
  static double getScaledHeight(BuildContext context, double scale) =>
      scale * MediaQuery.of(context).size.height;
}
