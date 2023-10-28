import '../../features/Mars/data/datasources/mars_pics_remote_data_source.dart';
import '../../features/Mars/data/repositories/mars_pics_repo_impl.dart';
import '../../features/Mars/domain/repositories/get_mars_pics_base_repo.dart';
import '../../features/Mars/presentation/controller/mars_controller.dart';
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
