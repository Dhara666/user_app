import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';

class CommonContainer extends StatelessWidget {
  final String text;
  final Color containerColor;
  final double textSize;
  final EdgeInsetsGeometry margin;
  final double containerWidth;

  CommonContainer({
    this.text = 'Enter Text',
    this.containerColor,
    this.textSize,
    this.margin,
    this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      // height: height * 0.0688,
      height: height * 0.055,
      width: containerWidth ?? width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor ?? ColorResource.containerColor.withOpacity(0.5),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: textSize ?? 18,
          fontWeight: FontWeight.w600,
          color: ColorResource.white,
        ),
      ),
    );
  }
}
