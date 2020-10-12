import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:market/src/blocs/authBloc.dart';
import 'package:market/src/styles/text.dart';

import 'dart:io';

import 'package:market/src/styles/textFields.dart';
import 'package:market/src/widgets/button.dart';
import 'package:market/src/widgets/social_buttons.dart';
import 'package:market/src/widgets/textFields.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: pageBody(context, authBloc),
      );
    } else {
      return Scaffold(
        body: pageBody(context, authBloc),
      );
    }
  }

  pageBody(BuildContext context, AuthBloc authBloc) {
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/top_bg.png'),
            fit: BoxFit.fill,
          )),
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            'assets/images/logo.png',
          ))),
        ),
        StreamBuilder<String>(
            stream: authBloc.email,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                cupertinoIcon: CupertinoIcons.mail_solid,
                materialIcon: Icons.mail,
                placeHolder: 'Email',
                inputType: TextInputType.emailAddress,
                onChange: authBloc.changeEmail,
                errorText: snapshot.error,
              );
            }),
        StreamBuilder<String>(
            stream: authBloc.password,
            builder: (context, snapshot) {
              return AppTextField(
                isIOS: Platform.isIOS,
                cupertinoIcon: IconData(
                  0xf4c9,
                  fontFamily: CupertinoIcons.iconFont,
                  fontPackage: CupertinoIcons.iconFontPackage,
                ),
                materialIcon: Icons.lock,
                placeHolder: 'Password',
                inputType: TextInputType.emailAddress,
                obscureText: true,
                onChange: authBloc.changePassword,
                errorText: snapshot.error,
              );
            }),
        StreamBuilder<bool>(
            stream: authBloc.isValid,
            builder: (context, snapshot) {
              return AppButton(
                buttonText: 'Signup',
                buttonType: (snapshot.data == true)
                    ? ButtonType.LightBlue
                    : ButtonType.Disable,
                onPressed: authBloc.signup,
              );
            }),
        Center(
          child: Text(
            "Or",
            style: TextStyles.suggestion(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: TextFieldStyle.verticalValue(),
              horizontal: TextFieldStyle.horizontalValue()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppSocialButton(
                socialType: SocialType.Facebook,
              ),
              AppSocialButton(
                socialType: SocialType.Google,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: TextFieldStyle.verticalValue(),
              horizontal: TextFieldStyle.horizontalValue()),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Already have an account? ",
                style: TextStyles.body(),
                children: [
                  TextSpan(
                      text: "Login",
                      style: TextStyles.link(),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.pushNamed(context, '/login'))
                ]),
          ),
        ),
      ],
    );
  }
}
