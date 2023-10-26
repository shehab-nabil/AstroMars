import 'package:astromars/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AstroMars extends StatelessWidget {
  const AstroMars({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'AstroMars',
      initialRoute: '/',
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      // locale: DevicePreview.locale(context),
    );
  }
}
