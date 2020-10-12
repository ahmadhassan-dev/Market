import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/src/app.dart';
import 'package:market/src/styles/text.dart';
import 'package:market/src/styles/textFields.dart';

class AppTextField extends StatefulWidget {
  final bool isIOS;
  final String placeHolder;
  final TextInputType inputType;
  final IconData materialIcon;
  final IconData cupertinoIcon;
  final bool obscureText;
  final void Function(String) onChange;
  final String errorText;

  AppTextField(
      {@required this.isIOS,
      @required this.placeHolder,
      @required this.materialIcon,
      @required this.cupertinoIcon,
      this.inputType,
      this.obscureText,
      this.onChange,
      this.errorText});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode _node;
  bool displayCupertinoErrorBorder;
  TextEditingController _controller;

  @override
  void initState() {
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
    super.initState();
    displayCupertinoErrorBorder = false;
    _controller = TextEditingController();
  }

  void _handleFocusChange() {
    if (_node.hasFocus == false && widget.errorText != null) {
      displayCupertinoErrorBorder = true;
    } else {
      displayCupertinoErrorBorder = false;
    }
    widget.onChange(_controller.text);
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
    _controller.dispose();
    _node.removeListener(_handleFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isIOS) {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: TextFieldStyle.verticalValue(),
            horizontal: TextFieldStyle.horizontalValue()),
        child: Column(
          children: <Widget>[
            CupertinoTextField(
              keyboardType: (widget.inputType != null)
                  ? widget.inputType
                  : TextInputType.text,
              padding: EdgeInsets.all(12.0),
              placeholder: widget.placeHolder,
              placeholderStyle: TextFieldStyle.placeHolder(),
              style: TextFieldStyle.text(),
              textAlign: TextFieldStyle.textAlign(),
              cursorColor: TextFieldStyle.cursonColor(),
              controller: _controller,
              decoration: (displayCupertinoErrorBorder)
                  ? TextFieldStyle.cupertinoErrorDecoration()
                  : TextFieldStyle.cupertinoDecoration(),
              prefix: TextFieldStyle.iconPrefix(widget.cupertinoIcon),
              obscureText:
                  (widget.obscureText != null) ? widget.obscureText : false,
              onChanged: widget.onChange,
              focusNode: _node,
            ),
            (widget.errorText != null)
                ? Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Text(widget.errorText, style: TextStyles.error())
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
            vertical: TextFieldStyle.verticalValue(),
            horizontal: TextFieldStyle.horizontalValue()),
        child: TextField(
          obscureText:
              (widget.obscureText != null) ? widget.obscureText : false,
          keyboardType: (widget.inputType != null)
              ? widget.inputType
              : TextInputType.text,
          cursorColor: TextFieldStyle.cursonColor(),
          style: TextFieldStyle.text(),
          textAlign: TextFieldStyle.textAlign(),
          decoration: TextFieldStyle.materialDecoration(
            widget.placeHolder,
            widget.materialIcon,
            widget.errorText,
          ),
          onChanged: widget.onChange,
        ),
      );
    }
  }
}
