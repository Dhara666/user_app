import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/model/meditation_model/meditation_model.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({this.meditationsModel});

  final MeditationsModel meditationsModel;

  @override
  MeditationScreenState createState() => MeditationScreenState();
}

class MeditationScreenState extends State<MeditationScreen> {
  Duration duration = Duration();
  Duration position = Duration();
  int result;
  bool playingStatus = false;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isVisible = true;

  String get _durationText => duration?.toString()?.split('.')?.first ?? '';

  String get _positionText => position?.toString()?.split('.')?.first ?? '';

  @override
  void initState() {
    // TODO: implement initState
    initPlayer();
    super.initState();
  }

  initPlayer() async {
    await audioPlayer.setUrl(widget.meditationsModel.audio);
    audioPlayer.durationStream.listen((event) => setState(() {
          duration = event;
        }));

    audioPlayer.positionStream.listen((event) => setState(() {
          position = event;
        }));
  }

  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    size(context);
    return Container(
      color: ColorResource.white,
      child: WillPopScope(
        onWillPop: () {
          audioPlayer.stop();
          Navigator.pop(context);
          return null;
        },
        child: SafeArea(
          top: isVisible,
          child: Scaffold(
            body: InkWell(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Stack(
                children: [
                  Container(
                    width: width,
                    height: height,
                    child: SvgPicture.asset(
                      ImagePath.backGroundImage2,
                      fit: BoxFit.cover,
                      width: width,
                      height: height,
                    ),
                  ),
                  ListView(
                    children: [
                      !isVisible ? SizedBox(height: 5) : SizedBox(),
                      !isVisible
                          ? Container(
                              height: height * 0.07,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      ImagePath.twoplusLogoBlack,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(height: 60),
                      isVisible
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.asset(
                                    ImagePath.galleryIcon,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(),
                      isVisible
                          ? Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: SvgPicture.asset(
                                    ImagePath.timerIcon,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isVisible
                              ? Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.meditationsModel.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: ColorResource.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        '${_positionText.substring(2, 7)} / ${_durationText.substring(2, 7)}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: ColorResource.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  padding: EdgeInsets.all(5.0),
                                  margin: EdgeInsets.symmetric(horizontal: 25),
                                  width: width,
                                )
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                isVisible
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          top: 8,
                                          left: width * 0.10,
                                        ),
                                        child: SvgPicture.asset(
                                          ImagePath.previewBackIcon,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                    : SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            position = Duration(
                                                seconds:
                                                    position.inSeconds - 10);
                                            audioPlayer.seek(position);
                                          },
                                          child: SvgPicture.asset(
                                            ImagePath.backwardIcon,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(width: 25),
                                        InkWell(
                                          onTap: () async {
                                            setState(() {
                                              playingStatus = !playingStatus;
                                            });

                                            !playingStatus
                                                ? await audioPlayer.pause()
                                                : await audioPlayer.play();
                                          },
                                          child: Container(
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                shape: BoxShape.circle,
                                                color: ColorResource.yellow,
                                              ),
                                              child: !playingStatus
                                                  ? Icon(
                                                      Icons.play_arrow,
                                                      size: 35,
                                                    )
                                                  : Icon(
                                                      Icons.pause,
                                                      size: 35,
                                                    ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 25),
                                        InkWell(
                                          onTap: () {
                                            position = Duration(
                                              seconds: position.inSeconds + 10,
                                            );
                                            audioPlayer.seek(position);
                                          },
                                          child: SvgPicture.asset(
                                            ImagePath.forwardIcon,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isVisible
                      ? CommonAppBar(
                          onTap: () {
                            audioPlayer.stop();
                            Navigator.pop(context);
                          },
                          image: ImagePath.appbarClose,
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
