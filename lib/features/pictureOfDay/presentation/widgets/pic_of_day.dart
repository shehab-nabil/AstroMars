import 'package:astromars/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';

class PictureOfTheDay extends StatelessWidget {
  const PictureOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        curve: Curves.easeIn,
        // duration: const Duration(milliseconds: 500),
        child: GestureDetector(
          // key: const Key('openMovieMinimalDetail'),
          onTap: () {
            Get.toNamed('/apodScreen');
          },
          child: Stack(
            children: [
              ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // fromLTRB
                        Colors.transparent,
                        Colors.black,
                        Colors.black,
                        Colors.transparent,
                      ],
                      stops: [0, 0.2, 0.8, 1],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/galaxy.jpg',
                    fit: BoxFit.cover,
                    height: 250,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 4.0),
                        Text(
                          'The Astronomy Picture of the Day '.toUpperCase(),
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
