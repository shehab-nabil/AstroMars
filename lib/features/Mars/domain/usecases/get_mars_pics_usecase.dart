import 'package:astromars/base_usecase/usecases.dart';
import 'package:astromars/core/error/failure.dart';
import 'package:astromars/features/Mars/domain/entities/mars_pics.dart';
import 'package:astromars/features/Mars/domain/repositories/get_Mars_pics_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetMarsPicsUseCase implements UseCases<List<MarsPics>, NoParams> {
  final MarsPicsBaseRepository marsPicsBaseRepository = Get.find();
  @override
  Future<Either<Failure, List<MarsPics>?>> call(params) {
    return marsPicsBaseRepository.getMarsPics();
  }
}
