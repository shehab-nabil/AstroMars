import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/error/failure.dart';
import 'package:astromars/core/network/network_info.dart';
import 'package:astromars/features/pictureOfDay/data/datasources/astronomy_pic_od_the_day_remote_datasource.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:astromars/features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AstronomyPictureOfTheDayRepositoryImpl
    extends AstronomyPictureOfTheDayRepository {
  final NetworkInfo networkInfo;
  final AstronomyPicOfTheDayRemoteDataSource
      astronomyPicOfTheDayRemoteDataSource;

  AstronomyPictureOfTheDayRepositoryImpl(
      {required this.astronomyPicOfTheDayRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AstronomyPictureOfTheDay>> getPicOfTheDay() async {
    if (await networkInfo.isConnected) {
      try {
        final picOfTheDay =
            await astronomyPicOfTheDayRemoteDataSource.getPicOfTheDay();
        return Right(picOfTheDay);
      } on ServerException {
        Get.defaultDialog(title: 'something goes wrong');
        return left(ServerFailure());
      }
    } else {
      Get.defaultDialog(title: 'please check your connction');
      return left(ServerFailure());
    }
  }
}
