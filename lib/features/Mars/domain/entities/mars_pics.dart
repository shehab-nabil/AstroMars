import 'package:equatable/equatable.dart';

class MarsPics extends Equatable {
  final int id;
  final String imgSrc;
  final String earthDate;

  const MarsPics(
      {required this.id, required this.imgSrc, required this.earthDate});

  @override
  List<Object> get props => [id, imgSrc, earthDate];
}
