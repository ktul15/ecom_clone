import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool isRounded;

  const PrimaryButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.isRounded = false,
  });

  factory PrimaryButton.rounded({
    Key? key,
    required String title,
    required Color backgroundColor,
  }) {
    return PrimaryButton(
      key: key,
      title: title,
      backgroundColor: backgroundColor,
      isRounded: true,
    );
  }

  factory PrimaryButton.squared({
    Key? key,
    required String title,
    required Color backgroundColor,
  }) {
    return PrimaryButton(
      key: key,
      title: title,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        maximumSize: Size(MediaQuery.of(context).size.width, 40),
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        backgroundColor: backgroundColor,
        foregroundColor: Pallete.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRounded ? 20 : 4),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
