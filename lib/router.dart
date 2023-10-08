import 'package:flutter/material.dart';
import 'package:magnetic_reconnection_space_app/features/home/screens/main_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case MainScreen.routeName:
      return MaterialPageRoute(builder: (_) => const MainScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("This route does not exist"),
                ),
              ));
  }
}
