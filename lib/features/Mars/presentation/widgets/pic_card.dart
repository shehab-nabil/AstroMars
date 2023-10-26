import 'package:astromars/core/utils/appcolors.dart';
import 'package:astromars/features/Mars/domain/entities/mars_pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarsPicCard extends StatelessWidget {
  const MarsPicCard({super.key, required this.pic});

  final MarsPics pic;

  @override
  Widget build(BuildContext context) {
    // final MarsController marsController = Get.find();
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      padding: const EdgeInsetsDirectional.all(5),
      child: GridTile(
        child: Container(
          color: AppColors.thirdColor,
          child: Image.network(
            pic.imgSrc,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
