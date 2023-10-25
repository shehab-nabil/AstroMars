import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:astromars/features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import 'package:astromars/features/pictureOfDay/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetPicOfTheDayUseCase
    extends UseCases<AstronomyPictureOfTheDay, NoParams> {
  final AstronomyPictureOfTheDayRepository astronomyPictureOfTheDayRepository =
      Get.find();

  @override
  Future<Either<Failure, AstronomyPictureOfTheDay?>> call(NoParams params) =>
      astronomyPictureOfTheDayRepository.getPicOfTheDay();
}
