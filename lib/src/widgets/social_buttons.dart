import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market/src/styles/base.dart';
import 'package:market/src/styles/button.dart';
import 'package:market/src/styles/colors.dart';
import 'package:market/src/styles/text.dart';

class AppSocialButton extends StatelessWidget {
  final SocialType socialType;

  AppSocialButton({@required this.socialType});
  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    Color iconColor;
    IconData icon;

    switch (socialType) {
      case SocialType.Facebook:
        icon = FontAwesomeIcons.facebook;
        iconColor = Colors.white;
        buttonColor = AppColors.facebook();
        break;
      case SocialType.Google:
        icon = FontAwesomeIcons.google;
        iconColor = Colors.white;
        buttonColor = AppColors.google();
        break;
      default:
        icon = FontAwesomeIcons.facebookF;
        iconColor = Colors.white;
        buttonColor = AppColors.facebook();
        break;
    }
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ButtonStyles.buttonHorizontalValue(),
          vertical: ButtonStyles.buttonVerticalValue()),
      child: Container(
        child: Icon(
          icon,
          color: iconColor,
        ),
        height: ButtonStyles.buttonHeight(),
        width: ButtonStyles.buttonWidth(),
        decoration: BoxDecoration(
            boxShadow: BaseStyle.boxShadow(),
            color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyle.borderRadius())),
      ),
    );
  }
}

enum SocialType { Facebook, Google }
