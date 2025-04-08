import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class TempGradientWidget extends StatelessWidget {
  const TempGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/home_carousel_images/bazaar.jpg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Pallete.lightGreyColor, Colors.transparent],
              stops: [0.3, 0.6],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
