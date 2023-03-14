import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget commonIndicator({double percent, Function onTap}) {
  return CircularPercentIndicator(
      radius: 75,
      lineWidth: 5.0,
      animation: true,
      percent: percent,
      center: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 65,
          decoration: BoxDecoration(
              color: ColorResource.yellow, shape: BoxShape.circle),
          child: Center(
            child: SvgPicture.asset(
              ImagePath.arrow,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: ColorResource.processColor);
}
