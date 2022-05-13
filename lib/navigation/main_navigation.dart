import 'package:best_food_by_birthday/widgets/screen_widgets/curing_screen.dart';
import 'package:best_food_by_birthday/widgets/screen_widgets/error_screen.dart';
import 'package:best_food_by_birthday/widgets/screen_widgets/healthy_screen.dart';
import 'package:best_food_by_birthday/widgets/screen_widgets/neutral_screen.dart';
import 'package:best_food_by_birthday/widgets/screen_widgets/unhealthy_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:best_food_by_birthday/widgets/main_screen/main_screen_widget.dart';

import '../widgets/date_picker/date_picker_widget.dart';

abstract class MainNavigationRoutes {
  static const main = '/';
  static const plus = '/load_plus';
  static const minus = '/load_minus';
  static const superPlus = '/load_superPlus';
  static const zero = '/load_zero';
  static const error = '/load_error';
  static const datePicker = '/datePicker';
}

class MainNavigtion {
  final initialRoute = MainNavigationRoutes.main;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutes.main: (context) => const MainScreenWidget(),
    MainNavigationRoutes.plus: (context) => const HealthyScreenWidget(),
    MainNavigationRoutes.minus: (context) => const UnhealthyScreenWidget(),
    MainNavigationRoutes.superPlus: (context) => const CuringScreenWidget(),
    MainNavigationRoutes.zero: (context) => const NeutralScreenWidget(),
    MainNavigationRoutes.error: (context) => const ErrorScreenWidget(),
    MainNavigationRoutes.datePicker: (context) => const DatePickerWidget(),
  };
}
