import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_indicator.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';
import 'package:meditation_twoplus/common/widget/common_text.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/page/onboarding_screens/onboarding_screen_four.dart';

class OnBoardingScreenThree extends StatefulWidget {
  @override
  OnBoardingScreenThreeState createState() => OnBoardingScreenThreeState();
}

class OnBoardingScreenThreeState extends State<OnBoardingScreenThree> {
  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    List<SelectMeditate> selectedList = [];
    List<SelectMeditate> meditateSelectList = [
      SelectMeditate(
          image: ImagePath.earlyMorningImages,
          meditateTime: "Early Morning",
          meditateReminder: "Reminder\n@ 7AM",
          isLeft: true),
      SelectMeditate(
          image: ImagePath.lateMorningImage,
          meditateTime: "Morning",
          meditateReminder: "Reminder\n@ 9AM",
          isLeft: true),
      SelectMeditate(
          image: ImagePath.noonImage,
          meditateTime: "Noon",
          meditateReminder: "Reminder \n@ 12:00PM",
          isLeft: true),
      SelectMeditate(
          image: ImagePath.afterNoonImages,
          meditateTime: "Afternoon",
          meditateReminder: "Reminder\n@ 2PM",
          isLeft: false),
      SelectMeditate(
          image: ImagePath.eveningImage,
          meditateTime: "Evening",
          meditateReminder: "Reminder \n@ 7:00PM",
          isLeft: false),
      SelectMeditate(
          image: ImagePath.nightImage,
          meditateTime: "Night",
          meditateReminder: "Reminder \n@ 10:00PM",
          isLeft: false),
    ];

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
                left: width * 0.02, right: width * 0.05, top: height * 0.04),
            children: [
              onBoardingAppBar(context: context),
              commonText(
                  padding: EdgeInsets.only(top: height * 0.008),
                  text: "When do you like to meditate?",
                  fontWeight: FontWeight.w700,
                  fontSize: height * 0.030,
                  textAlign: TextAlign.center),
              commonText(
                  text: "(You can select more than one)",
                  fontWeight: FontWeight.w300,
                  fontSize: height * 0.028,
                  textAlign: TextAlign.center),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: height * 0.005),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return MeditationItem(
                    item: meditateSelectList[index],
                    isSelected: (bool value) {
                      if (value) {
                        selectedList.add(meditateSelectList[index]);
                      } else {
                        selectedList.remove(meditateSelectList[index]);
                      }
                    },
                  );
                },
                itemCount: meditateSelectList.length,
              ),
              SizedBox(
                height: height * 0.008,
              ),
              commonIndicator(
                  percent: 0.75,
                  onTap: () {
                    if (selectedList.length >= 1) {
                      Navigator.push(
                        context,
                        SlideLeftRoute(
                            page: OnBoardingScreenFour(isRegister: false)),
                      );
                    } else {
                      commonSnackBar(
                          context: context, text: "Please Select One");
                    }
                  }),
            ],
          ),
          Positioned(
            bottom: 5,
            left: 8,
            child: Row(
              children: [
                commonText(
                    text: '3 ', fontWeight: FontWeight.bold, fontSize: 18),
                commonText(text: 'of 4', fontSize: 18),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectMeditate {
  String image;
  String meditateTime;
  String meditateReminder;
  bool isLeft;

  SelectMeditate(
      {this.image, this.meditateTime, this.meditateReminder, this.isLeft});
}

class MeditationItem extends StatefulWidget {
  final SelectMeditate item;
  final ValueChanged<bool> isSelected;

  MeditationItem({this.item, this.isSelected});

  @override
  MeditationItemState createState() => MeditationItemState();
}

class MeditationItemState extends State<MeditationItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    SelectMeditate item = widget.item;
    return InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
        },
        child: Container(
          padding: EdgeInsets.only(bottom: height * 0.008),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.isLeft == true
                  ? Expanded(
                      child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: height * 0.010),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              commonText(
                                  padding: isSelected
                                      ? EdgeInsets.only(top: 0)
                                      : EdgeInsets.only(top: height * 0.025),
                                  text: item.meditateTime,
                                  color: isSelected
                                      ? ColorResource.black
                                      : ColorResource.lightGrey,
                                  fontSize: height * 0.025,
                                  textAlign: TextAlign.center),
                              commonText(
                                  text: isSelected ? item.meditateReminder : '',
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.025,
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    )
                  : Expanded(child: Container()),
              Container(
                child: isSelected
                    ? Image.asset(item.image)
                    : Opacity(opacity: 0.4, child: Image.asset(item.image)),
                height: height > 700 ? height * 0.106 : height * 0.102,
              ),
              item.isLeft == false
                  ? Expanded(
                      child: Container(
                          padding:
                              EdgeInsets.only(right: 10, top: height * 0.010),
                          child: Column(
                            children: [
                              commonText(
                                  padding: isSelected
                                      ? EdgeInsets.only(top: 0)
                                      : EdgeInsets.only(top: height * 0.025),
                                  text: item.meditateTime,
                                  color: isSelected
                                      ? ColorResource.black
                                      : ColorResource.lightGrey,
                                  fontSize: height * 0.025,
                                  textAlign: TextAlign.center),
                              commonText(
                                  text: isSelected ? item.meditateReminder : '',
                                  fontWeight: FontWeight.w700,
                                  fontSize: height * 0.025,
                                  textAlign: TextAlign.center),
                            ],
                          )),
                    )
                  : Expanded(child: Container()),
            ],
          ),
        ));
  }
}
