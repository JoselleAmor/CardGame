import 'package:flutter/material.dart';
import 'game.dart';
import 'main.dart';
import 'levelUp.dart';
import 'gameover.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => StartPage(),
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 750),
        );

      case '/levelUp':
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => LevelUpPage(),
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 750),
        );

      case '/gameover':
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => gameover(),
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: Duration(milliseconds: 750),
        );

      case '/game':
      // Validation of correct data type
        if (args is String) {
          return PageRouteBuilder(
            pageBuilder: (c, a1, a2) => GamePage(data:'Hello Second page'),
            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: 750),
          );
        }




        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
    return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}