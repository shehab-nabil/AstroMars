import 'package:astromars/features/pictureOfDay/data/datasources/astronomy_pic_od_the_day_remote_datasource.dart';
import 'package:astromars/features/pictureOfDay/data/repositories/astronomy_pic_of_the_day_repo.dart';
import 'package:astromars/features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import 'package:astromars/features/pictureOfDay/domain/usecases/get_pic_of_the_day.dart';
import 'package:astromars/features/pictureOfDay/presentation/controller/astronomy_pic_controller.dart';
import 'package:get/get.dart';

class AstronomyPicBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AstronomyPicOfTheDayController());
    Get.put(GetPicOfTheDay(astronomyPictureOfTheDayRepository: Get.find()));
    Get.put(AstronomyPictureOfTheDayRepositoryImpl(
        astronomyPicOfTheDayRemoteDataSource: Get.find(),
        networkInfo: Get.find()));
    Get.put(AstronomyPicOfTheDayController());
    Get.put(AstronomyPicOfTheDayRemoteDataSourceImpl());
  }
}
