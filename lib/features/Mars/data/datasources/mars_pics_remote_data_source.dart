import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/utils/api.dart';
import 'package:astromars/features/Mars/data/models/mars_pics_model.dart';
import 'package:dio/dio.dart';

abstract class MarsPicsBaseRemoteDataSource {
  Future<List<MarsPicsModel>> getMarsPics();
}

class MarsPicsRemoteDataSource implements MarsPicsBaseRemoteDataSource {
  @override
  Future<List<MarsPicsModel>> getMarsPics() async {
    final response = await Dio().get(Api.baseMPUrl);
    if (response.statusCode == 200) {
      return List<MarsPicsModel>.from((response.data['photos'] as List)
          .map((e) => MarsPicsModel.fromJson(e)));
    } else {
      throw const ServerException();
    }
  }
}
