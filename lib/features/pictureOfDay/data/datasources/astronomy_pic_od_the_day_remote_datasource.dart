import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/utils/api.dart';
import 'package:astromars/features/pictureOfDay/data/models/astronomy_pic_of_the_day_model.dart';
import 'package:dio/dio.dart';

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
