import '../../../../core/error/failure.dart';
import '../entities/apod.dart';
import '../repositories/get_pic_repository.dart';
import '../../../../base_usecase/usecases.dart';
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
