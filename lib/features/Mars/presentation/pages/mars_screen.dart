import 'package:astromars/core/utils/appcolors.dart';
import 'package:astromars/features/Mars/domain/entities/mars_pics.dart';
import 'package:astromars/features/Mars/presentation/controller/mars_controller.dart';
import 'package:astromars/features/Mars/presentation/widgets/pic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MarsScreen extends StatelessWidget {
  const MarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.5,
          iconTheme: IconThemeData(color: AppColors.thirdColor),
          title: Text('Mars Photos in 2023/10/20 ',
              style: TextStyle(color: AppColors.primaryColor)),
          backgroundColor: AppColors.whiteColor),
      body: Padding(
        padding: EdgeInsets.zero,
        child: GetBuilder<MarsController>(
            init: MarsController(),
            builder: (controller) {
              if (controller.marsState.isLoading()) {
                return Center(
                  child: LoadingAnimationWidget.discreteCircle(
                    color: AppColors.primaryColor,
                    size: 60,
                    secondRingColor: AppColors.secColor,
                    thirdRingColor: AppColors.thirdColor,
                  ),
                );
              } else if (controller.marsState.isSuccess()) {
                final listPics = controller.marsState.data as List<MarsPics>;
                return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3.1,
                      mainAxisSpacing: .5,
                      crossAxisSpacing: 0),
                  itemBuilder: (context, index) => MarsPicCard(
                    pic: listPics[index],
                  ),
                  itemCount: listPics.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                );
              } else {
                return const Center(child: Text('unkonwn'));
              }
            }),
      ),
    );
  }
}
