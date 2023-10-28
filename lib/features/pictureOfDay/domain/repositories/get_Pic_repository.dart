import '../../../../core/error/failure.dart';
import '../entities/apod.dart';
import 'package:dartz/dartz.dart';

abstract class AstronomyPictureOfTheDayRepository {
  Future<Either<Failure, AstronomyPictureOfTheDay>> getPicOfTheDay();
}
