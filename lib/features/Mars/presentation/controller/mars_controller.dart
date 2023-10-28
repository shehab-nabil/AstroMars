import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../pictureOfDay/presentation/controller/resource_states.dart';
import '../../data/repositories/mars_pics_repo_impl.dart';

class MarsController extends GetxController {
  final MarsPicsRepositoryImpl _marsPicsRepositoryImpl = Get.find();
  StateResource marsState = StateResource.init();
  DateTime? date = DateTime.now().subtract(const Duration(hours: 48));
  @override
  void onInit() {
    super.onInit();
    getMarsPics();
  }

  showDate() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now().subtract(const Duration(hours: 48)),
      firstDate: DateTime(2012, 8, 16),
      lastDate: DateTime.now().subtract(const Duration(hours: 48)),
    ).then((value) {
      date = value;
      getMarsPics();
      update();
    });
  }

  Future<void> getMarsPics() async {
    marsState = StateResource.loading();

    final response = await _marsPicsRepositoryImpl.getMarsPics(earthDay: date!);

    response.fold((l) => marsState = StateResource.error('error'), (r) {
      marsState = StateResource.loading();
      marsState = StateResource.success(r);
    });

    update();
  }
}
