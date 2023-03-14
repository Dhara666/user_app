import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_button.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/page/log_in/log_in_screen.dart';
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_one.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    size(context);
    print('Current screen --> $runtimeType');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: SvgPicture.asset(
              ImagePath.fullBackgroundImage,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: SvgPicture.asset(
                      ImagePath.appbarTitleImage,
                      height: height * 0.15,
                      //height: 90,
                      fit: BoxFit.cover,
                    )),
                commonText(
                  text: 'Welcome! ',
                  fontSize: height * 0.056,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.only(top: height * 0.09),
                ),
                commonText(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  fontSize: height * 0.0285,
                  fontWeight: FontWeight.w300,
                  padding: EdgeInsets.only(top: 5),
                ),
                commonText(
                  text:
                      'Before you start,  we have a few questions to help us serve you better. ',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.only(top: height * 0.1),
                ),
                CommonButton(
                  text: 'Let’s get started',
                  image: ImagePath.arrow,
                  padding: EdgeInsets.only(top: height * 0.03),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: OnBoardingScreenOne()),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: height * 0.011),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        commonText(
                          text: 'Already have an account? ',
                          fontSize: height * 0.0285,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                        commonText(
                          text: 'Login',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              children: [
                commonText(
                  text: 'By using the twoplus app you agree to our',
                  fontStyle: FontStyle.italic,
                  fontSize: 17.5,
                  fontWeight: FontWeight.w300,
                  padding: EdgeInsets.only(top: height * 0.13),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText(
                      text: 'Privacy Policy ',
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                    ),
                    commonText(
                        text: ' and ',
                        fontStyle: FontStyle.italic,
                        fontSize: 17.5),
                    commonText(
                      text: 'Terms and Conditions',
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
