import 'package:easy2know_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:easy2know_flutter/features/home/presentation/pages/queries_page.dart';
import 'package:easy2know_flutter/features/home/presentation/pages/topics_page.dart';
import 'package:easy2know_flutter/features/theme/presentation/themes_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ThemesScreen.namedRout:
        return MaterialPageRoute(builder: (_) => ThemesScreen());
      case TopicsPage.namedRout:
//        var projectId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => TopicsPage());
      case DashboardPage.namedRout:
        var topicListIndex = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => DashboardPage(
                  topicListIndex: topicListIndex,
                ));
      case QueriesPage.namedRout:
        return MaterialPageRoute(builder: (_) => QueriesPage());
      default:
        return noRouteWidget(settings);
    }
  }
}

MaterialPageRoute noRouteWidget(RouteSettings settings) {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  });
}
