import '../../../../core/utils/appcolors.dart';
import '../../domain/entities/mars_pics.dart';
import '../controller/mars_controller.dart';
import '../widgets/pic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MarsScreen extends GetView<MarsController> {
  const MarsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // DateTime? date;
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: () {
                    controller.showDate();
                  },
                  focusColor: AppColors.thirdColor,
                  splashColor: AppColors.thirdColor,
                  icon: const Icon(Icons.calendar_month),
                  color: AppColors.secColor),
            ),
          ],
          elevation: 0.5,
          iconTheme: IconThemeData(color: AppColors.thirdColor),
          // title: Text('Mars Photos in 2023/10/20 ',
          //     style: TextStyle(color: AppColors.primaryColor)),
          title: GetBuilder<MarsController>(
              init: MarsController(),
              builder: (controller) {
                // controller.date = date;
                return Text(
                  'Photos of  ${controller.date!.year} / ${controller.date!.month} / ${controller.date!.day} ',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                );
              }),
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
