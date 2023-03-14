import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: ColorResource.white.withOpacity(0.8),
        child: SpinKitCircle(
          color: ColorResource.black,
          size: 42,
        ),
      ),
    );
  }
}
