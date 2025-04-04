import 'package:client/core/theme/app_pallette.dart';
import 'package:client/features/home/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class StickySearchFieldAndScanSection extends StatelessWidget {
  const StickySearchFieldAndScanSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      padding: EdgeInsets.only(top: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.appBarGradient1, Pallete.appBarGradient2],
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 9, child: SearchTextField()),
          Expanded(flex: 1, child: Icon(Icons.qr_code_scanner)),
        ],
      ),
    );
  }
}
