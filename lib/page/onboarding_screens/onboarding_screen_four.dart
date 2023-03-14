import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/comman_textfield.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_button.dart';
import 'package:meditation_twoplus/common/widget/common_indicator.dart';
import 'package:meditation_twoplus/common/widget/common_loader.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'onboarding_screen_view_model.dart';

class OnBoardingScreenFour extends StatefulWidget {
  final bool isRegister;

  OnBoardingScreenFour({this.isRegister = false});

  @override
  OnBoardingScreenFourState createState() => OnBoardingScreenFourState();
}

class OnBoardingScreenFourState extends State<OnBoardingScreenFour> {
  OnBoardingScreenViewModel model;
  bool obscure = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_statements
    model ?? (model = OnBoardingScreenViewModel(this));
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
          ListView(
            physics: PageScrollPhysics(),
            padding: EdgeInsets.only(
                left: width * 0.02, right: width * 0.02, top: height * 0.038),
            children: [
              onBoardingAppBar(context: context, isSkip: false),
              commonText(
                textAlign: TextAlign.center,
                text:
                    'Create your twoplus™ account \nusing one of the following \nlogin methods:',
                fontWeight: FontWeight.bold,
                padding: EdgeInsets.only(top: height * 0.008),
                fontSize: height * 0.030,
              ),
              SizedBox(height: height * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: SocialMediaButton(
                  color: ColorResource.blue,
                  image: ImagePath.facebookIcon,
                  text: "Continue with Facebook ",
                  textColor: Colors.white,
                  fontWeight: FontWeight.w700,
                  onTap: model.onTapFacebookLogin,
                ),
              ),
              SizedBox(height: height * 0.020),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: SocialMediaButton(
                  color: ColorResource.white,
                  image: ImagePath.googleIcon,
                  text: "Continue with Google",
                  textColor: Colors.black.withOpacity(0.54),
                  fontWeight: FontWeight.w500,
                  onTap: model.onTapGoogleSignIn,
                ),
              ),
              Container(
                width: 50,
                height: 5,
                margin: EdgeInsets.only(
                    top: height > 700 ? height * 0.030 : height * 0.024,
                    bottom: height > 700 ? height * 0.030 : height * 0.024,
                    left: width * 0.160,
                    right: width * 0.160),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorResource.lightPink,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: CommonTextField(
                  controller: nameController,
                  hintText: "Your name",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: CommonTextField(
                  controller: emailOrPhoneController,
                  hintText: "Email",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: CommonTextField(
                    controller: passwordController,
                    isObscureText: obscure,
                    hintText: 'Password',
                    suffix: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: InkWell(
                          child: Icon(
                            obscure ? Icons.visibility_off : Icons.visibility,
                            size: 25,
                            color: ColorResource.lightGrey,
                          ),
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          }),
                    )),
              ),
              widget.isRegister
                  ? CommonButton(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      text: 'Sign Up',
                      image: ImagePath.arrow,
                      onPressed: () {
                        if (nameController.text == null ||
                            nameController.text == '') {
                          commonSnackBar(
                              text: "All field is required", context: context);
                        } else {
                          model.onTapEmailSignUp();
                        }
                      })
                  : SizedBox(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText(
                    text: 'By using the twoplus app you agree to our',
                    fontStyle: FontStyle.italic,
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w300,
                    padding: EdgeInsets.only(
                        top: height > 700 ? height * 0.040 : height * 0.015),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                          text: 'Privacy Policy',
                          fontSize: width * 0.045,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                      commonText(
                          text: ' and ',
                          fontStyle: FontStyle.italic,
                          fontSize: width * 0.045),
                      commonText(
                          text: 'Terms and Conditions',
                          fontSize: width * 0.045,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.025),
              !widget.isRegister
                  ? commonIndicator(
                      percent: 1.0,
                      onTap: () {
                        if (nameController.text == null ||
                            nameController.text == '') {
                          commonSnackBar(
                              text: "All field is required", context: context);
                        } else {
                          model.onTapEmailSignUp();
                        }
                      })
                  : SizedBox(),
              SizedBox(height: height * 0.012),
              !widget.isRegister
                  ? Row(
                      children: [
                        commonText(
                            text: '4 ',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        commonText(text: 'of 4', fontSize: 18),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
          model.isLoading ? LoadingPage() : Container(),
        ],
      ),
    );
  }
}
