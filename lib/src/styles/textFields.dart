import 'package:flutter/material.dart';
import 'package:market/src/styles/base.dart';
import 'package:market/src/styles/colors.dart';
import 'package:market/src/styles/text.dart';

abstract class TextFieldStyle {
  static double horizontalValue() {
    return 25.0;
  }

  static double verticalValue() {
    return 8.0;
  }

  static TextStyle text() {
    return TextStyles.body();
  }

  static TextStyle placeHolder() {
    return TextStyles.suggestion();
  }

  static Color cursonColor() {
    return AppColors.darkBlue();
  }

  static Widget iconPrefix(IconData icon) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Icon(
        icon,
        size: 35.0,
        color: AppColors.lightBlue(),
      ),
    );
  }

  static TextAlign textAlign() {
    return TextAlign.center;
  }

  static BoxDecoration cupertinoDecoration() {
    return BoxDecoration(
      border:
          Border.all(color: AppColors.straw(), width: BaseStyle.borderWidth()),
      borderRadius: BorderRadius.circular(BaseStyle.borderRadius()),
    );
  }

  static BoxDecoration cupertinoErrorDecoration() {
    return BoxDecoration(
      border:
          Border.all(color: AppColors.red(), width: BaseStyle.borderWidth()),
      borderRadius: BorderRadius.circular(BaseStyle.borderRadius()),
    );
  }

  static InputDecoration materialDecoration(
      String hint, IconData icon, String errorText) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(8.0),
      hintText: hint,
      hintStyle: TextFieldStyle.placeHolder(),
      border: InputBorder.none,
      errorText: errorText,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.straw(),
            width: BaseStyle.borderWidth(),
          ),
          borderRadius: BorderRadius.circular(
            BaseStyle.borderRadius(),
          )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.straw(),
            width: BaseStyle.borderWidth(),
          ),
          borderRadius: BorderRadius.circular(
            BaseStyle.borderRadius(),
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.straw(),
            width: BaseStyle.borderWidth(),
          ),
          borderRadius: BorderRadius.circular(
            BaseStyle.borderRadius(),
          )),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.red(),
            width: BaseStyle.borderWidth(),
          ),
          borderRadius: BorderRadius.circular(
            BaseStyle.borderRadius(),
          )),
      prefixIcon: iconPrefix(icon),
    );
  }
}
