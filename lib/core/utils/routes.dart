import 'package:astromars/core/binding/astronomy_pic_binding.dart';
import 'package:astromars/features/pictureOfDay/presentation/pages/astronomy_pic_of_the_day_screen.dart';
import 'package:astromars/features/pictureOfDay/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static const String initialRoute = '/';
  static const String apodScreen = '/apodScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return GetPageRoute(
          page: () => const HomeScreen(),
        );
      case Routes.apodScreen:
        return GetPageRoute(
            page: () => const AstronomyPicOfTheDayScreen(),
            binding: AstronomyPicBinding());

      default:
        return undefindRoute();
    }
  }

  static Route<dynamic> undefindRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                  child: Text('no Route find', style: TextStyle(fontSize: 70))),
            ));
  }
}
