import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/utils/routes.dart';

class AstroMars extends StatelessWidget {
  const AstroMars({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'AstroMars',
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.red),
      // useInheritedMediaQuery: true,
      // builder: DevicePreview.appBuilder,
      // locale: DevicePreview.locale(context),
    );
  }
}
