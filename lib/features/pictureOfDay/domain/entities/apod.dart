// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AstronomyPictureOfTheDay extends Equatable {
  final String date;
  final String explanation;
  final String hdurl;
  final String title;

  const AstronomyPictureOfTheDay(
      {required this.date,
      required this.explanation,
      required this.hdurl,
      required this.title});

  @override
  List<Object> get props => [date, explanation, hdurl, title];
}
