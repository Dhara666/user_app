import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_four.dart';

class CommonAppBar extends PreferredSize {
  final GestureTapCallback onTap;
  final String image;
  final EdgeInsetsGeometry margin;

  CommonAppBar({this.onTap, this.image, this.margin});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height * 0.07,
        padding: EdgeInsets.only(
          right: width * 0.022,
          left: width * 0.022,
        ),
        decoration: BoxDecoration(
          color: ColorResource.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              offset: Offset(1, 5),
            ),
          ],
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                alignment: Alignment.topLeft,
                width: 50,
                margin: EdgeInsets.only(left: 5),
                padding:
                    margin ?? EdgeInsets.symmetric(vertical: height * 0.024),
                child: SvgPicture.asset(image),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: SvgPicture.asset(
                  ImagePath.appbarTitleImage,
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.017),
                child: SvgPicture.asset(
                  ImagePath.appbarMessageImage,
                )),
          ],
        ),
      ),
    );
  }
}

Widget onBoardingAppBar({BuildContext context, bool isSkip = true}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
            height: 30,
            width: 33,
            child: SvgPicture.asset(
              ImagePath.appbarBackArrow,
              fit: BoxFit.fill,
            )),
      ),
      isSkip
          ? InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: OnBoardingScreenFour()),
                );
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 8, right: 10, left: 10),
                child: commonText(
                    text: 'Skip', fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          : SizedBox(),
    ],
  );
}

// Widget onBoardingAppBar({BuildContext context}) {
//   return Container(
//     padding: EdgeInsets.only(top: 5),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: (){
//             Navigator.pop(context);
//           },
//           child: Container(
//               height: 20,
//               width: 13,
//               child: SvgPicture.asset(
//                 ImagePath.appbarBackArrow,
//                 fit: BoxFit.fill,
//                 // height: 25,
//                 // width: 25,
//               )),
//         ),
//         commonText(
//             text: 'Skip', fontSize: 16, fontWeight: FontWeight.bold),
//       ],
//     ),
//   );
// }
