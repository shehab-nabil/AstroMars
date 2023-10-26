import 'package:astromars/features/Mars/data/datasources/mars_pics_remote_data_source.dart';
import 'package:astromars/features/Mars/data/repositories/mars_pics_repo_impl.dart';
import 'package:astromars/features/Mars/domain/repositories/get_Mars_pics_base_repo.dart';
import 'package:astromars/features/Mars/presentation/controller/mars_controller.dart';
import 'package:get/get.dart';

class MarsPicsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarsController>(() => MarsController());
    Get.lazyPut<MarsPicsBaseRemoteDataSource>(() => MarsPicsRemoteDataSource());
    Get.lazyPut<MarsPicsBaseRepository>(() => MarsPicsRepositoryImpl());
    Get.lazyPut<MarsPicsRepositoryImpl>(() => MarsPicsRepositoryImpl());
  }
}
