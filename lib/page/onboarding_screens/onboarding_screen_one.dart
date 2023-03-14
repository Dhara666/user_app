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
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_two.dart';

class OnBoardingScreenOne extends StatefulWidget {
  const OnBoardingScreenOne({Key key}) : super(key: key);

  @override
  _OnBoardingScreenOneState createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenOne> {
  List<PersonalityModel> selectedList = [];

  @override
  Widget build(BuildContext context) {
    print("Current screen -->$runtimeType");
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
                left: width * 0.02, right: width * 0.02, top: height * 0.04),
            children: [
              onBoardingAppBar(context: context),
              commonText(
                  textAlign: TextAlign.center,
                  text: 'Which of the following \ndescribes you best?',
                  fontWeight: FontWeight.bold,
                  padding: EdgeInsets.only(top: 5),
                  fontSize: height * 0.03),
              commonText(
                  textAlign: TextAlign.center,
                  text: '(You can select more than one)',
                  fontWeight: FontWeight.w300,
                  padding: EdgeInsets.only(bottom: 10),
                  fontSize: height * 0.028),
              Container(
                margin: EdgeInsets.symmetric(horizontal: height * 0.047),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: height > 700 ? 4.7 / 5.342 : 4 / 3.7,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Personality(
                      item: personalityGridList[index],
                      isSelected: (bool value) {
                        setState(() {
                          if (value) {
                            selectedList.add(personalityGridList[index]);
                          } else {
                            selectedList.remove(personalityGridList[index]);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: height > 700 ? 10 : 3),
                child: commonIndicator(
                    percent: 0.25,
                    onTap: () {
                      if (selectedList.length >= 1) {
                        Navigator.push(
                          context,
                          SlideLeftRoute(page: OnBoardingScreenTwo()),
                        );
                      } else {
                        commonSnackBar(context: context, text: 'Select  one');
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
                commonText(
                    text: '1 ', fontWeight: FontWeight.bold, fontSize: 18),
                commonText(text: 'of 4', fontSize: 18),
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<PersonalityModel> personalityGridList = [
  PersonalityModel(title: "Persona 1"),
  PersonalityModel(
    title: "Persona 2",
  ),
  PersonalityModel(
    title: "Persona 3",
  ),
  PersonalityModel(
    title: "Persona 4",
  ),
  PersonalityModel(
    title: "Persona 5",
  ),
  PersonalityModel(
    title: "Persona 6",
  ),
];

class Personality extends StatefulWidget {
  final PersonalityModel item;
  final ValueChanged<bool> isSelected;

  Personality({this.item, this.isSelected});

  @override
  _PersonalityState createState() => _PersonalityState();
}

class _PersonalityState extends State<Personality> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    PersonalityModel item = widget.item;
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Column(
        children: [
          Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  depth: -5,
                  lightSource: LightSource.top,
                  intensity: 1,
                  disableDepth: !isSelected,
                  color:isSelected
                      ? ColorResource.onBoardingCardColor
                      : ColorResource.onBoardingCardColor.withOpacity(0.50),

              ),
              child: Container(
                height: height > 700 ?height *0.16 : height * 0.14,
                width: height > 700 ?width *0.33 : width * 0.28,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)),
              )
          ),
          commonText(
              text: item.title,
              // fontSize: height * 0.024,
              fontSize: 14,
              color: isSelected
                  ? Color(0xff323232)
                  : ColorResource.onBoardingCardColor.withOpacity(0.50),
              fontWeight: FontWeight.bold,
              padding: EdgeInsets.only(top: 3)),
          commonText(
            text: 'Subtitle',
            fontSize: 11,
            color: isSelected
                ? Color(0xff323232)
                : ColorResource.onBoardingCardColor.withOpacity(0.50),
            fontWeight: FontWeight.w400,
            padding: EdgeInsets.only(bottom: 3),
          )
        ],
      ),
    );
  }
}
