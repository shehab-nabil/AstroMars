import 'package:astromars/core/utils/appcolors.dart';
import 'package:astromars/core/utils/strings.dart';
import 'package:astromars/features/pictureOfDay/presentation/widgets/pic_of_day.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: .13,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(AppStrings.appName,
            style: TextStyle(color: AppColors.primaryColor, fontSize: 30)),
      ),
      body: const Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: PictureOfTheDay(),
        )
      ]),
    );
  }
}
