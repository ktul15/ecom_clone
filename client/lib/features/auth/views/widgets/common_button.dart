import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final bool isRounded;
  final double fontSize;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CommonButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.isRounded = false,
    this.isLoading = false,
    this.fontSize = 14,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        maximumSize: Size(MediaQuery.of(context).size.width, 40),
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        backgroundColor: backgroundColor,
        foregroundColor: Pallete.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isRounded ? 20 : 4),
        ),
      ),
      child:
          isLoading
              ? Center(child: CircularProgressIndicator.adaptive())
              : Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
              ),
    );
  }

  factory CommonButton.rounded({
    Key? key,
    required String title,
    required Color backgroundColor,
  }) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: backgroundColor,
      isRounded: true,
    );
  }

  factory CommonButton.squared({
    Key? key,
    required String title,
    required Color backgroundColor,
  }) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: backgroundColor,
    );
  }

  factory CommonButton.grayed({
    Key? key,
    required String title,
    VoidCallback? onPressed,
  }) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: Pallete.lightGreyColor,
      onPressed: onPressed,
    );
  }

  factory CommonButton.primary({
    Key? key,
    required String title,
    VoidCallback? onPressed,
  }) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: Pallete.primaryColor,
      onPressed: onPressed,
    );
  }

  factory CommonButton.primaryRounded({
    Key? key,
    required String title,
    double fontSize = 14,
    VoidCallback? onPressed,
  }) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: Pallete.primaryColor,
      isRounded: true,
      fontSize: fontSize,
      onPressed: onPressed,
    );
  }

  factory CommonButton.roundedLoading({Key? key, required String title}) {
    return CommonButton(
      key: key,
      title: title,
      backgroundColor: Pallete.primaryColor,
      isRounded: true,
      isLoading: true,
    );
  }
}
