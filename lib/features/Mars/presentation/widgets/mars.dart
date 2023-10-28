import '../../../../core/utils/appcolors.dart';
import '../../../../core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarsPlanet extends StatelessWidget {
  const MarsPlanet({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: AppColors.thirdColor,
      highlightColor: AppColors.whiteColor,
      onTap: () => Get.toNamed(Routes.marsScreen),
      child: Column(
        children: [
          PhysicalModel(
            color: AppColors.thirdColor,
            elevation: 50,
            shape: BoxShape.circle,
            child: const CircleAvatar(
              radius: 120,
              backgroundImage: AssetImage('assets/images/mars.jpg'),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Mars'.toUpperCase(),
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
