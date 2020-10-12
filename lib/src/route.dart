import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/src/screens/landing.dart';
import 'package:market/src/screens/login.dart';
import 'package:market/src/screens/signup.dart';

abstract class Routes {
  static MaterialPageRoute materialPageRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Landing(),
        );
        break;

      case '/login':
        return MaterialPageRoute(
          builder: (context) => Login(),
        );
        break;

      case '/signup':
        return MaterialPageRoute(
          builder: (context) => Signup(),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (context) => Landing(),
        );
        break;
    }
  }

  static CupertinoPageRoute cupertinoPageRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (context) => Landing(),
        );
        break;

      case '/login':
        return CupertinoPageRoute(
          builder: (context) => Login(),
        );
        break;

      case '/signup':
        return CupertinoPageRoute(
          builder: (context) => Signup(),
        );
        break;

      default:
        return CupertinoPageRoute(
          builder: (context) => Landing(),
        );
        break;
    }
  }
}
