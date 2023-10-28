import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/apod.dart';
import '../../domain/repositories/get_pic_repository.dart';
import '../datasources/astronomy_pic_od_the_day_remote_datasource.dart';

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
