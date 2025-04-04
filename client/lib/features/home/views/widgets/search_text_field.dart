import 'package:client/core/theme/app_pallette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Pallete.whiteColor,
        hintText: "Search or ask a question",
        hintStyle: TextStyle(color: Pallete.subtitleText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Pallete.greyColor, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Pallete.greyColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Pallete.greyColor, width: 1),
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(CupertinoIcons.qrcode),
      ),
    );
  }
}
