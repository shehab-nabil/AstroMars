import 'package:astromars/features/Mars/domain/entities/mars_pics.dart';

class MarsPicsModel extends MarsPics {
  const MarsPicsModel(
      {required super.id, required super.imgSrc, required super.earthDate});

  factory MarsPicsModel.fromJson(Map<String, dynamic> json) => MarsPicsModel(
      id: json['id'], imgSrc: json['img_src'], earthDate: json['earth_date']);
}
