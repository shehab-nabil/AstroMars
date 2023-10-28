import '../../features/pictureOfDay/data/datasources/astronomy_pic_od_the_day_remote_datasource.dart';
import '../../features/pictureOfDay/data/repositories/astronomy_pic_of_the_day_repo.dart';
import '../../features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import '../../features/pictureOfDay/presentation/controller/astronomy_pic_controller.dart';
import 'package:get/get.dart';

class AstronomyPicBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AstronomyPicOfTheDayController>(
        () => AstronomyPicOfTheDayController());
    Get.lazyPut<AstronomyPicOfTheDayRemoteDataSource>(
        () => AstronomyPicOfTheDayRemoteDataSourceImpl());
    Get.lazyPut<AstronomyPictureOfTheDayRepository>(
        () => AstronomyPictureOfTheDayRepositoryImpl());
    Get.lazyPut<AstronomyPictureOfTheDayRepositoryImpl>(
        () => AstronomyPictureOfTheDayRepositoryImpl());
    // Get.lazyPut(() => NetworkInfo);
  }
}
