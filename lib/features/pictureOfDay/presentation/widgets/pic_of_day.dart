import 'package:astromars/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PictureOfTheDay extends StatelessWidget {
  const PictureOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // key: const Key('openMovieMinimalDetail'),
      onTap: () {
        Get.toNamed('/apodScreen');
      },
      child: Column(
        children: [
          Container(
            height: 250,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.thirdColor, width: 3),
              shape: BoxShape.rectangle,
            ),
            child: Image.asset(
              'assets/images/galaxy.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'The Astronomy Picture of the Day '.toUpperCase(),
            style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
