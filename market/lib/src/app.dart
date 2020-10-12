import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/src/blocs/authBloc.dart';
import 'package:market/src/route.dart';
import 'package:market/src/screens/login.dart';
import 'dart:io';

import 'package:provider/provider.dart';

final authBloc = AuthBloc();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider(
        create: (context) => authBloc,
      )
    ], child: AppPlatform());
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }
}

class AppPlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        home: Login(),
        onGenerateRoute: Routes.cupertinoPageRoute,
        theme: CupertinoThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    } else {
      return MaterialApp(
        home: Login(),
        onGenerateRoute: Routes.materialPageRoute,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
      );
    }
  }
}
