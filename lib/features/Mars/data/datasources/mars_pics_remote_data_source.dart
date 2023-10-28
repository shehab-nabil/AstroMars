import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/api.dart';
import '../models/mars_pics_model.dart';
import 'package:dio/dio.dart';

abstract class MarsPicsBaseRemoteDataSource {
  Future<List<MarsPicsModel>> getMarsPics({required DateTime earthDay});
}

class MarsPicsRemoteDataSource implements MarsPicsBaseRemoteDataSource {
  @override
  Future<List<MarsPicsModel>> getMarsPics({required DateTime earthDay}) async {
    final response = await Dio().get(
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=${earthDay.year}-${earthDay.month}-${earthDay.day}&api_key=${Api.apiKey}');
    if (response.statusCode == 200) {
      return List<MarsPicsModel>.from((response.data['photos'] as List)
          .map((e) => MarsPicsModel.fromJson(e)));
    } else {
      throw const ServerException();
    }
  }
}
