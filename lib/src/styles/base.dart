import 'package:flutter/painting.dart';
import 'package:market/src/styles/colors.dart';

abstract class BaseStyle {
  static double borderWidth() {
    return 2.0;
  }

  static double borderRadius() {
    return 20.0;
  }

  static double animationOffset() {
    return 2.0;
  }

  static List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
          blurRadius: 2.0,
          color: AppColors.darkGrey(),
          offset: Offset(1.0, 2.0))
    ];
  }

  static List<BoxShadow> boxShadowPressed() {
    return [
      BoxShadow(
          blurRadius: 1.0,
          color: AppColors.darkGrey(),
          offset: Offset(1.0, 1.0))
    ];
  }
}
