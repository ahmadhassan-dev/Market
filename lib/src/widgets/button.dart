import 'package:flutter/cupertino.dart';
import 'package:market/src/styles/base.dart';
import 'package:market/src/styles/button.dart';
import 'package:market/src/styles/colors.dart';
import 'package:market/src/styles/text.dart';

class AppButton extends StatefulWidget {
  final String buttonText;
  final ButtonType buttonType;
  final Function onPressed;

  AppButton({@required this.buttonText, this.buttonType, this.onPressed});

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;

    switch (widget.buttonType) {
      case ButtonType.Straw:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.straw();
        break;
      case ButtonType.DarkBlue:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.darkBlue();
        break;
      case ButtonType.DarkGrey:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.darkGrey();
        break;
      case ButtonType.LightBlue:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.lightBlue();
        break;
      case ButtonType.Disable:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.lightGrey();
        break;
      default:
        fontStyle = TextStyles.buttonTextLight();
        buttonColor = AppColors.lightBlue();
        break;
    }
    return AnimatedContainer(
      child: Padding(
        padding: EdgeInsets.only(
          left: ButtonStyles.buttonHorizontalValue(),
          top: (pressed)
              ? ButtonStyles.buttonVerticalValue() + BaseStyle.animationOffset()
              : ButtonStyles.buttonVerticalValue(),
          bottom: (pressed)
              ? ButtonStyles.buttonVerticalValue() - BaseStyle.animationOffset()
              : ButtonStyles.buttonVerticalValue(),
          right: ButtonStyles.buttonHorizontalValue(),
        ),
        child: GestureDetector(
          child: Container(
            child: Center(
                child: Text(
              widget.buttonText,
              style: fontStyle,
            )),
            height: ButtonStyles.buttonHeight(),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                boxShadow: (pressed)
                    ? BaseStyle.boxShadowPressed()
                    : BaseStyle.boxShadow(),
                color: buttonColor,
                borderRadius: BorderRadius.circular(BaseStyle.borderRadius())),
          ),
          onTapDown: (details) {
            setState(() {
              if (widget.buttonType != ButtonType.Disable) pressed = !pressed;
            });
          },
          onTapUp: (details) {
            setState(() {
              if (widget.buttonType != ButtonType.Disable) pressed = !pressed;
            });
          },
          onTap: () {
            if (widget.buttonType != ButtonType.Disable) {
              widget.onPressed();
            }
          },
        ),
      ),
      duration: Duration(milliseconds: 20),
    );
  }
}

enum ButtonType { LightBlue, Straw, Disable, DarkGrey, DarkBlue }
