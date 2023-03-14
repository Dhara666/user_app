import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_button.dart';
import 'package:meditation_twoplus/common/widget/common_loader.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/generated/l10n.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen.dart';
import 'package:meditation_twoplus/page/start_subscription_screen/start_subscription_screen_view_model.dart';

class StartSubscriptionScreen extends StatefulWidget {
  @override
  StartSubscriptionScreenState createState() => StartSubscriptionScreenState();
}

class StartSubscriptionScreenState extends State<StartSubscriptionScreen> {
  StartSubscriptionScreenViewModel startSubscriptionScreenViewModel;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    startSubscriptionScreenViewModel ??
        // ignore: unnecessary_statements
        (startSubscriptionScreenViewModel =
            StartSubscriptionScreenViewModel(this));
    size(context);
    double fontSize = width * 0.045;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF9DCDB),
                  Color(0xffF1A7A6),
                  Color(0xffE5343C)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(height: height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).subscription_access,
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 35,
                          ),
                        ),
                        SizedBox(width: 10),
                        SvgPicture.asset(
                          ImagePath.twoplusLogoBlack,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    commonListTile(S.of(context).subscription_subscription1),
                    commonListTile(S.of(context).subscription_subscription2),
                    commonListTile(S.of(context).subscription_subscription3),
                    commonListTile(S.of(context).subscription_subscription4),
                    commonListTile(S.of(context).subscription_subscription5),
                    SizedBox(height: height * 0.03),
                    CommonButton(
                      text: S.of(context).subscription_freeTrial,
                      image: ImagePath.arrow,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        if (startSubscriptionScreenViewModel
                            .availableProducts.isNotEmpty)
                          startSubscriptionScreenViewModel
                              .meditationProductStatus();
                        else
                          commonSnackBar(
                            context: context,
                            text: S.of(context).appPurchase_notAvailable,
                            label: 'Go Home?',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                          );
                      },
                    ),
                    SizedBox(height: height * 0.010),
                    Center(
                      child: Text(
                        S.of(context).subscription_annualBillAmount,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          color: ColorResource.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 5,
                  left: width * 0.05,
                  right: width * 0.05,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            S.of(context).subscription_policy1,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              fontSize: fontSize,
                              color: ColorResource.white,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).subscription_policy2,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  fontSize: fontSize,
                                  color: ColorResource.white,
                                ),
                              ),
                              Text(
                                S.of(context).common_and,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic,
                                  fontSize: fontSize,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                S.of(context).subscription_policy3,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic,
                                  fontSize: fontSize,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          isLoading ? LoadingPage() : Container()
        ],
      ),
    );
  }

  commonListTile(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ListTile(
        horizontalTitleGap: 2,
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff74B963),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: SvgPicture.asset(ImagePath.check),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
