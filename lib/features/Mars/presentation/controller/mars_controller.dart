import 'package:astromars/features/Mars/data/repositories/mars_pics_repo_impl.dart';
import 'package:astromars/features/pictureOfDay/presentation/controller/resource_states.dart';
import 'package:get/get.dart';

class MarsController extends GetxController {
  final MarsPicsRepositoryImpl _marsPicsRepositoryImpl = Get.find();
  StateResource marsState = StateResource.init();
  @override
  void onInit() {
    super.onInit();
    getMarsPics();
  }

  Future<void> getMarsPics() async {
    marsState = StateResource.loading();

    final response = await _marsPicsRepositoryImpl.getMarsPics();

    response.fold((l) => marsState = StateResource.error('error'), (r) {
      marsState = StateResource.loading();
      marsState = StateResource.success(r);
    });

    update();
  }
}
