import 'package:astromars/features/pictureOfDay/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static const String initialRoute = '/';
  static const String testScreen = '/testScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return GetPageRoute(
          page: () => const HomeScreen(),
        );
      // case Routes.testScreen:
      //   return GetPageRoute(
      //     page: () => const TestPage(),
      //   );

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
