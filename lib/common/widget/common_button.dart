import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final double textSize;
  final String image;
  final EdgeInsetsGeometry padding;
  final Function onPressed;

  CommonButton(
      {this.text = 'Enter Text',
      this.padding,
      this.textSize = 24,
      this.image,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0.0),
      child: Container(
        height: height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorResource.yellow,
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 0.75),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
            ),
          ],
        ),
        child: MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: textSize),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SvgPicture.asset(image),
              ],
            ),
            onPressed: onPressed),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String image;
  final Function onTap;
  final String text;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;

  SocialMediaButton(
      {this.text,
      this.onTap,
      this.image,
      this.color,
      this.textColor,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.08,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.0, 0.75),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 10),
            Text(text,
                style: TextStyle(
                    color: textColor ?? Colors.black,
                    fontSize: height * 0.025,
                    fontWeight: fontWeight),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
