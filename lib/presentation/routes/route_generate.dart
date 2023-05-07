import 'package:flutter/material.dart';

import 'package:elemes_app/presentation/routes/route_name.dart';
import 'package:elemes_app/presentation/screens/screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreenPage(),
        );
      case RouteNames.kHomeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => AppMainScreenPage(),
        );
      case RouteNames.kSearchRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreenPage(),
        );
      case RouteNames.kListRoute:
        return MaterialPageRoute(
          builder: (context) => const ListScreenPage(),
        );

      default:
        return null;
    }
  }
}

class SplashScreenCubit {}
