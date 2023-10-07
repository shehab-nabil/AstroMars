import 'dart:convert';

import 'package:astromars/core/error/exceptions.dart';
import 'package:astromars/core/utils/api.dart';
import 'package:astromars/features/pictureOfDay/data/models/astronomy_pic_of_the_day_model.dart';
import 'package:dio/dio.dart';

abstract class AstronomyPicOfTheDayRemoteDataSource {
  Future<AstronomyPictureOfTheDayModel> getPicOfTheDay();
}

class AstronomyPicOfTheDayRemoteDataSourceImpl
    extends AstronomyPicOfTheDayRemoteDataSource {
  @override
  Future<AstronomyPictureOfTheDayModel> getPicOfTheDay() async {
    var dio = Dio();
    var response = await dio.request(
      Api.baseAPOTDUrl,
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      return AstronomyPictureOfTheDayModel.fromJson(
          json.decode(response.data.toString()));
    } else {
      throw const ServerException();
    }
  }
}
