import 'package:flutter/material.dart';
import 'package:best_food_by_birthday/navigation/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigtion();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: mainNavigation.routes,
        initialRoute: mainNavigation.initialRoute,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.brown,
            appBarTheme: const AppBarTheme(
              color: Colors.brown,
            )));
  }
}
