import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_indicator.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/model/onboarding_model/onboarding_model.dart';
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_three.dart';

class OnBoardingScreenTwo extends StatefulWidget {
  const OnBoardingScreenTwo({Key key}) : super(key: key);

  @override
  OnBoardingScreenTwoState createState() => OnBoardingScreenTwoState();
}

class OnBoardingScreenTwoState extends State<OnBoardingScreenTwo> {
  List<ExperienceModel> selectedList = [];
  List<ExperienceModel> sampleData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(
      ExperienceModel(
          title: "Lots",
          isSelected: false,
          description:
              'You’ll see our whole \ncollection of meditations \nfor all experience levels.',
          timeSession: '20 - 30 minute sessions'),
    );
    sampleData.add(
      ExperienceModel(
          title: "Some",
          isSelected: false,
          description:
              'We’ll show you shorter meditations and ease \nyou into longer ones.',
          timeSession: '5 - 10 minute sessions'),
    );
    sampleData.add(
      ExperienceModel(
          title: "Little or None",
          isSelected: false,
          description:
              'We’ll start you off with \nour beginner friendly \nplaylist.',
          timeSession: '30 - 40 minute sessions'),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Current screen -->$runtimeType");
    return Scaffold(
        body: Stack(children: [
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
            left: width * 0.02, right: width * 0.02, top: height * 0.04),
        children: [
          onBoardingAppBar(context: context),
          commonText(
              textAlign: TextAlign.center,
              text: 'What’s your experience with meditation? ',
              fontWeight: FontWeight.bold,
              padding: EdgeInsets.only(top: 0),
              fontSize: height * 0.03),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sampleData.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      sampleData.forEach(
                              (element) => element.isSelected = false);
                      sampleData[index].isSelected = true;
                      selectedList.clear();
                      selectedList.add(sampleData[index]);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: height * 0.055),
                    child: Row(
                      children: [
                        Expanded(
                            flex: height > 700 ? 3 : 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(
                                    color: sampleData[index].isSelected
                                        ? Color(0xff323232)
                                        : ColorResource.onBoardingCardColor,
                                    text: sampleData[index].title,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.023),
                                commonText(
                                    color: sampleData[index].isSelected
                                        ? Color(0xff323232)
                                        : ColorResource.onBoardingCardColor,
                                    text: sampleData[index].description,
                                    fontWeight: FontWeight.w300,
                                    fontSize: height * 0.023,
                                    padding: EdgeInsets.only(bottom: 2)),
                                sampleData[index].isSelected
                                    ? commonText(
                                        color: sampleData[index].isSelected
                                            ? Color(0xff323232)
                                            : ColorResource.onBoardingCardColor,
                                        text: sampleData[index].timeSession,
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.0226,
                                        padding: EdgeInsets.only(top: 5))
                                    : Container()
                              ],
                            )),
                        Expanded(
                          flex: height > 700 ? 2 : 1,
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              shape: NeumorphicShape.flat,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(10)),
                              depth: -5,
                              lightSource: LightSource.top,
                              intensity: 1,
                              disableDepth: !sampleData[index].isSelected,
                              color: sampleData[index].isSelected
                                  ? ColorResource.onBoardingCardColor
                                  : ColorResource.onBoardingCardColor
                                      .withOpacity(0.50),
                            ),
                            child: Container(
                              height:
                                  height > 700 ? height * 0.16 : height * 0.15,
                              width: height > 700 ? width * 0.33 : width * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height > 700 ? 15 : 23),
            child: commonIndicator(
                percent: 0.5,
                onTap: () {
                  if (selectedList.length >= 1) {
                    Navigator.push(
                      context,
                      SlideLeftRoute(page: OnBoardingScreenThree()),
                    );
                  } else {
                    commonSnackBar(context: context, text: 'Select any one');
                  }
                }),
          ),
        ],
      ),
      Positioned(
        bottom: 5,
        left: 8,
        child: Row(
          children: [
            commonText(text: '2 ', fontWeight: FontWeight.bold, fontSize: 18),
            commonText(text: 'of 4', fontSize: 18),
          ],
        ),
      )
    ]));
  }
}
