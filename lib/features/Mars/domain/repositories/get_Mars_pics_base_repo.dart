import 'package:astromars/core/error/failure.dart';
import '../entities/mars_pics.dart';
import 'package:dartz/dartz.dart';

abstract class MarsPicsBaseRepository {
  Future<Either<Failure, List<MarsPics>>> getMarsPics(
      {required DateTime earthDay});
}
