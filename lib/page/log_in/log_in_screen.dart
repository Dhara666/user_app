import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/comman_textfield.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_button.dart';
import 'package:meditation_twoplus/common/widget/common_loader.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/page/log_in/log_in_screen_view_model.dart';
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_four.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  LoginScreenViewModel model;
  TextEditingController emailOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    // ignore: unnecessary_statements
    model ?? (model = LoginScreenViewModel(this));
    size(context);
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
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.04),
            children: [
              Stack(
                children: [
                  onBoardingAppBar(context: context, isSkip: false),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: SvgPicture.asset(
                      ImagePath.appbarTitleImage,
                      fit: BoxFit.cover,
                      height: height * 0.15,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: Text('Welcome back.',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: height * 0.056)),
              ),
              Text('You’ve been missed!',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 36)),
              SizedBox(height: height * 0.015),
              SocialMediaButton(
                color: ColorResource.blue,
                image: ImagePath.facebookIcon,
                text: 'Continue with Facebook ',
                textColor: Colors.white,
                fontWeight: FontWeight.w700,
                onTap: model.onTapFacebookLogin,
              ),
              SizedBox(height: height * 0.015),
              SocialMediaButton(
                color: ColorResource.white,
                image: ImagePath.googleIcon,
                text: 'Continue with Google',
                textColor: Colors.black.withOpacity(0.54),
                fontWeight: FontWeight.w500,
                onTap: model.onTapGoogleSignIn,
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
              CommonTextField(
                controller: emailOrPhoneController,
                hintText: 'Email',
              ),
              CommonTextField(
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
              SizedBox(
                height: height * 0.005,
              ),
              CommonButton(
                  text: 'Sign In',
                  image: ImagePath.arrow,
                  onPressed: model.onTapEmailSignIn),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideLeftRoute(
                        page: OnBoardingScreenFour(isRegister: true)),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.010),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                          text: 'Don’t have an account? ',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.0285),
                      commonText(
                          text: 'Register',
                          fontWeight: FontWeight.w700,
                          fontSize: height * 0.0285)
                    ],
                  ),
                ),
              ),
            ],
          ),
          model.isLoading ? LoadingPage() : Container()
        ],
      ),
    );
  }
}
