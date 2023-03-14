import 'package:flutter/material.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';

commonSnackBar({
  @required String text,
  VoidCallback onPressed,
  String label = '',
  @required BuildContext context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: ColorResource.yellow,
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: label,
        onPressed: onPressed ?? () {},
      ),
    ),
  );
}
