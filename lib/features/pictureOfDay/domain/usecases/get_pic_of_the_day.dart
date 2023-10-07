import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:astromars/features/pictureOfDay/domain/repositories/get_pic_repository.dart';
import 'package:astromars/features/pictureOfDay/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class GetPicOfTheDay extends UseCases<AstronomyPictureOfTheDay, NoParams> {
  final AstronomyPictureOfTheDayRepository astronomyPictureOfTheDayRepository;

  GetPicOfTheDay({required this.astronomyPictureOfTheDayRepository});
  @override
  Future<Either<Failure, AstronomyPictureOfTheDay?>> call(NoParams params) =>
      astronomyPictureOfTheDayRepository.getPicOfTheDay();
}
