import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class AstronomyPictureOfTheDayRepository {
  Future<Either<Failure, AstronomyPictureOfTheDay>> getPicOfTheDay();
}
