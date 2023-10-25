import 'package:astromars/core/utils/appcolors.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:astromars/features/pictureOfDay/presentation/controller/astronomy_pic_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';

class AstronomyPicOfTheDayScreen extends StatelessWidget {
  const AstronomyPicOfTheDayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AstronomyPicOfTheDayController>(
          init: AstronomyPicOfTheDayController(),
          builder: (controller) {
            if (controller.apotdState.isLoading()) {
              return const SizedBox(
                  height: 400,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            } else if (controller.apotdState.isSuccess()) {
              final apotd =
                  controller.apotdState.data as AstronomyPictureOfTheDay;
              return CustomScrollView(
                key: const Key('picOfTheDayScrollView'),
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    pinned: false,
                    stretch: true,
                    expandedHeight: 600.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [-0.0, 0.12, 1.0, 1.0],
                            ).createShader(
                              Rect.fromLTRB(0.0, 1.0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            imageUrl: apotd.url,
                            //    "https://apod.nasa.gov/apod/image/2310/IoFlyby_Juno_960.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(apotd.title,
                              // 'The Once and Future Stars of Andromeda',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 9.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  apotd.date,
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 16.0)
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(apotd.explanation,
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (controller.apotdState.isError()) {
              return SizedBox(
                  height: 400,
                  child: Center(
                    child: Text(controller.apotdState.error!),
                  ));
            } else {
              return const Center(child: Text('unkonwn'));
            }
          }),
    );
  }
}
