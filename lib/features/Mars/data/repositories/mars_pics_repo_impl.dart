import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/Mars/data/datasources/mars_pics_remote_data_source.dart';
import 'package:astromars/features/Mars/domain/entities/mars_pics.dart';
import 'package:astromars/features/Mars/domain/repositories/get_Mars_pics_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MarsPicsRepositoryImpl implements MarsPicsBaseRepository {
  final MarsPicsBaseRemoteDataSource marsPicsBaseRemoteDataSource = Get.find();
  @override
  Future<Either<Failure, List<MarsPics>>> getMarsPics() async {
    try {
      final respose = await marsPicsBaseRemoteDataSource.getMarsPics();
      return Right(respose);
    } on ServerException {
      Get.defaultDialog(title: 'something goes wrong');
      return left(ServerFailure());
    }
  }
}
