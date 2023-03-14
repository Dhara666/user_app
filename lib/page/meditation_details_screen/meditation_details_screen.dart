import 'package:flutter/material.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_button.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/generated/l10n.dart';
import 'package:meditation_twoplus/model/meditation_model/meditation_model.dart';
import 'package:meditation_twoplus/page/meditation_screen/meditation_screen.dart';

class MeditationDetailsScreen extends StatefulWidget {
  MeditationDetailsScreen({this.meditationsModel});

  final MeditationsModel meditationsModel;

  @override
  MeditationDetailsScreenState createState() => MeditationDetailsScreenState();
}

class MeditationDetailsScreenState extends State<MeditationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    size(context);
    return Container(
      color: ColorResource.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.meditationsModel.background),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.130),
                      child: Text(
                        '${(widget.meditationsModel.length / 60).toStringAsFixed(2)} ${S.of(context).meditation_meditationPlayerTime}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: height * 0.027,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.010),
                    Text(
                      widget.meditationsModel.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: height * 0.047,
                        color: ColorResource.white,
                      ),
                    ),
                    Spacer(flex: 4),
                    Container(
                      height: height / 2.6,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(
                        vertical: height * 0.025,
                        horizontal: height * 0.03,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorResource.white.withOpacity(0.7),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 70),
                            child: SingleChildScrollView(
                              primary: true,
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                widget.meditationsModel.description,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CommonButton(
                              image: ImagePath.play,
                              text: S.of(context).meditationPlayer_playSession,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  SlideLeftRoute(
                                      page: MeditationScreen(
                                          meditationsModel:
                                              widget.meditationsModel)),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              CommonAppBar(
                onTap: () => Navigator.pop(context),
                margin: EdgeInsets.symmetric(vertical: height * 0.020),
                image: ImagePath.appbarBackArrow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
