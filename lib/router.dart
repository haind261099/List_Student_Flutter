import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/list.dart';
import 'pages/list_detail.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case listStudent:
        return MaterialPageRoute(builder: (context) => ListStudent());
      case listDetail:
        return MaterialPageRoute(builder: (context) => ListDetail(data: args));
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
