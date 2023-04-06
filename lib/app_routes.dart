import 'package:apptest/presentation/views/choice_view.dart';
import 'package:apptest/presentation/views/date_of_birth_view.dart';
import 'package:apptest/presentation/views/result_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // screens
  static const CHOICE_VIEW = 'choiceView';
  static const DATE_OF_BIRTH_VIEW = 'dateOfBirthView';
  static const RESULT_VIEW = 'resultView';

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CHOICE_VIEW:
        return _materialRoute(ChoiceView(), routeSettings: routeSettings);
      case DATE_OF_BIRTH_VIEW:
        return _materialRoute(DateOfBirthView(), routeSettings: routeSettings);
      case RESULT_VIEW:
        return _materialRoute(ResultView(), routeSettings: routeSettings);
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view,
      {RouteSettings? routeSettings}) {
    return MaterialPageRoute(
        builder: (_) => Builder(
            builder: (BuildContext context) =>
                MediaQuery(child: view, data: MediaQuery.of(context))),
        settings: routeSettings);
  }
}
