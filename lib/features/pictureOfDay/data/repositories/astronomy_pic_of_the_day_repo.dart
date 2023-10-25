import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/pictureOfDay/data/datasources/astronomy_pic_od_the_day_remote_datasource.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:astromars/features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class AstronomyPictureOfTheDayRepositoryImpl
    implements AstronomyPictureOfTheDayRepository {
  // final NetworkInfo networkInfo = Get.find();
  final AstronomyPicOfTheDayRemoteDataSource
      astronomyPicOfTheDayRemoteDataSource = Get.find();

  @override
  Future<Either<Failure, AstronomyPictureOfTheDay>> getPicOfTheDay() async {
    try {
      final respose =
          await astronomyPicOfTheDayRemoteDataSource.getPicOfTheDay();
      return Right(respose);
    } on ServerException {
      Get.defaultDialog(title: 'something goes wrong');
      return left(ServerFailure());
    }
  }
}
