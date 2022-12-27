import 'package:flutter/material.dart';
import 'package:isekaitec/utils/color_constants.dart';

class CircularProgressIndicatorApp extends StatelessWidget {
  const CircularProgressIndicatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CircularProgressIndicator(
        color: Color(ColorConstants.COLOR_PRIMARY),
        backgroundColor: Color(ColorConstants.whiteColor),
        strokeWidth: 4,),
    );
  }
}