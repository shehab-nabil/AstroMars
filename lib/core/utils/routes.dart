import '../binding/astronomy_pic_binding.dart';
import '../binding/mars_pics_binding.dart';
import '../../features/Mars/presentation/pages/mars_screen.dart';
import '../../features/pictureOfDay/presentation/pages/astronomy_pic_of_the_day_screen.dart';
import '../../features/pictureOfDay/presentation/pages/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Routes {
  static const String initialRoute = '/';
  static const String apodScreen = '/apodScreen';
  static const String homeScreen = '/homeScreen';
  static const String marsScreen = '/marsScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return GetPageRoute(
          page: () => const SplashScreen(),
        );
      case Routes.apodScreen:
        return GetPageRoute(
            page: () => const AstronomyPicOfTheDayScreen(),
            binding: AstronomyPicBinding());
      case Routes.homeScreen:
        return GetPageRoute(
          page: () => const HomeScreen(),
        );
      case Routes.marsScreen:
        return GetPageRoute(
          page: () => const MarsScreen(),
          binding: MarsPicsBinding(),
        );

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
