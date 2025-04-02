import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class GrayButton extends StatelessWidget {
  final String title;

  const GrayButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        maximumSize: Size(MediaQuery.of(context).size.width, 40),
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        backgroundColor: Pallete.lightGreyColor,
        foregroundColor: Pallete.textColor,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Pallete.lightGreyColor,
        // gradient: LinearGradient(
        //   colors: [Pallete.gradient1, Pallete.gradient2],
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        // ),
        border: Border.all(color: Pallete.greyColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(title, textAlign: TextAlign.center),
    );
  }
}
