import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/api.dart';
import '../models/astronomy_pic_of_the_day_model.dart';

abstract class AstronomyPicOfTheDayRemoteDataSource {
  Future<AstronomyPictureOfTheDayModel> getPicOfTheDay();
}

class AstronomyPicOfTheDayRemoteDataSourceImpl
    implements AstronomyPicOfTheDayRemoteDataSource {
  @override
  Future<AstronomyPictureOfTheDayModel> getPicOfTheDay() async {
    final response = await Dio().get(Api.baseAPOTDUrl);
    if (response.statusCode == 200) {
      return AstronomyPictureOfTheDayModel.fromJson(response.data);
    } else {
      throw const ServerException();
    }
  }
}
