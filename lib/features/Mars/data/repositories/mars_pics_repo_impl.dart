import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../datasources/mars_pics_remote_data_source.dart';
import '../../domain/entities/mars_pics.dart';
import '../../domain/repositories/get_mars_pics_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MarsPicsRepositoryImpl implements MarsPicsBaseRepository {
  final MarsPicsBaseRemoteDataSource marsPicsBaseRemoteDataSource = Get.find();
  @override
  Future<Either<Failure, List<MarsPics>>> getMarsPics(
      {required DateTime earthDay}) async {
    try {
      final respose =
          await marsPicsBaseRemoteDataSource.getMarsPics(earthDay: earthDay);
      return Right(respose);
    } on ServerException {
      Get.defaultDialog(title: 'something goes wrong');
      return left(ServerFailure());
    }
  }
}
