import '../../../../base_usecase/usecases.dart';
import '../../../../core/error/failure.dart';
import '../entities/mars_pics.dart';
import '../repositories/get_mars_pics_base_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class GetMarsPicsUseCase implements UseCases<List<MarsPics>, NoParams> {
  final MarsPicsBaseRepository marsPicsBaseRepository = Get.find();
  @override
  Future<Either<Failure, List<MarsPics>?>> call(params) {
    DateTime earthDay = DateTime.now();
    return marsPicsBaseRepository.getMarsPics(earthDay: earthDay);
  }
}
