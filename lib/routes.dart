import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kintore/ui/CounterScreen.dart';

class Routes {
  static RouteFactory onGenerateRoute = (RouteSettings settings) {
    switch (settings.name) {
      case CounterScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => CounterScreen(),
        );
      default:
        return null;
    }
  };
}
