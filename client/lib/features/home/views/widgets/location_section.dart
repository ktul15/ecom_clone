import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Pallete.locationSectionGradient1,
            Pallete.locationSectionGradient2,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.location_on_outlined, color: Pallete.textColor),
          Text("Delivering to Ahmedabad 380001 - Update location"),
          Icon(Icons.keyboard_arrow_down_outlined, color: Pallete.textColor),
        ],
      ),
    );
  }
}
