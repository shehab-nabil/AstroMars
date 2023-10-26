import 'package:astromars/core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarsPlanet extends StatelessWidget {
  const MarsPlanet({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.marsScreen),
      child: const CircleAvatar(
        radius: 180,
        backgroundImage: AssetImage('assets/images/mars.jpg'),
      ),
    );
  }
}
