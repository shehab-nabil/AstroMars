import '../../../../core/error/failure.dart';
import '../../../../core/utils/strings.dart';
import '../../data/repositories/astronomy_pic_of_the_day_repo.dart';
import 'resource_states.dart';
import 'package:get/get.dart';

class AstronomyPicOfTheDayController extends GetxController {
  final AstronomyPictureOfTheDayRepositoryImpl
      _astronomyPictureOfTheDayRepositoryImpl = Get.find();
  // final GetPicOfTheDayUseCase _getPicOfTheDayUseCase = Get.find();
  StateResource apotdState = StateResource.init();
  @override
  void onInit() {
    super.onInit();
    getPicOfTheDay();
  }

  Future<void> getPicOfTheDay() async {
    apotdState = StateResource.loading();

    final response =
        await _astronomyPictureOfTheDayRepositoryImpl.getPicOfTheDay();
    response.fold((l) => apotdState = StateResource.error('error'),
        (r) => apotdState = StateResource.success(r));

    update();
  }

  String failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
