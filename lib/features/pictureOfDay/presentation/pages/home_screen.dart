import '../../../../core/utils/appcolors.dart';
import '../../../../core/utils/strings.dart';
import '../../../Mars/presentation/widgets/mars.dart';
import '../widgets/pic_of_day.dart';
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
      body: const SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
            child: PictureOfTheDay(),
          ),
          SizedBox(
            height: 40,
          ),
          MarsPlanet(),
        ]),
      ),
    );
  }
}
