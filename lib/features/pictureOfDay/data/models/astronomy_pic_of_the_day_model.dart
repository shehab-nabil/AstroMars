import 'package:astromars/features/pictureOfDay/domain/entities/apod.dart';

class AstronomyPictureOfTheDayModel extends AstronomyPictureOfTheDay {
  const AstronomyPictureOfTheDayModel({
    required date,
    required explanation,
    required url,
    required title,
  }) : super(date: date, explanation: explanation, url: url, title: title);

  factory AstronomyPictureOfTheDayModel.fromJson(Map<String, dynamic> json) =>
      AstronomyPictureOfTheDayModel(
        date: json["date"],
        explanation: json["explanation"],
        url: json["url"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "explanation": explanation,
        "url": url,
        "title": title,
      };
}
