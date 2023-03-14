import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_twoplus/common/utils/size_utils.dart';
import 'package:meditation_twoplus/common/widget/common_appbar.dart';
import 'package:meditation_twoplus/common/widget/common_container.dart';
import 'package:meditation_twoplus/common/widget/common_loader.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/constant/color_constant.dart';
import 'package:meditation_twoplus/constant/image_constant.dart';
import 'package:meditation_twoplus/generated/l10n.dart';
import 'package:meditation_twoplus/model/article_model/article_model.dart';
import 'package:meditation_twoplus/model/meditation_model/meditation_model.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen_view_model.dart';
import 'package:meditation_twoplus/page/landing_screen/landing_screen.dart';
import 'package:meditation_twoplus/page/meditation_details_screen/meditation_details_screen.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel;
  bool isPlay = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print('Current screen --> $runtimeType');
    // ignore: unnecessary_statements
    homeScreenViewModel ?? (homeScreenViewModel = HomeScreenViewModel(this));
    size(context);
    return Container(
      color: ColorResource.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context, SlideLeftRoute(page: LandingScreen()));
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ),
          ),
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.backGroundImage1),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.09),
                    child: Column(
                      children: [
                        CommonContainer(
                          text: S.of(context).home_goodMorning,
                          containerWidth: width * 0.88,
                          margin:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                        ),
                        Container(
                          width: width * 0.32,
                          height: height * 0.14,
                          margin: EdgeInsets.only(top: height * 0.0072),
                          decoration: BoxDecoration(
                            color: ColorResource.yellow,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: Offset(0.0, 0.75),
                                blurRadius: 1.5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 38,
                                height: 35,
                                margin: EdgeInsets.only(top: height * 0.012),
                                child: SvgPicture.asset(
                                  ImagePath.favourite,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.0053),
                                child: Text(
                                  S.of(context).home_aboutFeeling,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.025,
                                    color: ColorResource.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: height * 0.0072,
                            bottom: height * 0.01,
                          ),
                          child: Text(
                            S.of(context).home_checkIn,
                            style: TextStyle(
                              color: ColorResource.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        CommonContainer(
                          text: S.of(context).home_feedbackQuestion,
                          containerWidth: width * 0.987,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        Container(
                          height: height * 0.280,
                          margin: EdgeInsets.only(
                            left: width * 0.012,
                            top: height * 0.009,
                          ),
                          child: ListView.builder(
                            itemCount:
                                homeScreenViewModel.articleModelData.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return listViewItem(
                                articleModelData:
                                    homeScreenViewModel.articleModelData[index],
                              );
                            },
                          ),
                        ),
                        CommonContainer(
                          text: S.of(context).home_meditationTitle,
                          containerWidth: width * 0.987,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: height * 0.009,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.16,
                maxChildSize: 0.89,
                minChildSize: height > 700 ? 0.15 : 0.16,
                builder: (BuildContext context, scrollController) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorResource.white.withOpacity(0.95),
                        border: Border.all(color: ColorResource.containerColor),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        children: [
                          StickyHeader(
                            header: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorResource.white.withOpacity(0.95),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 5,
                                    margin: EdgeInsets.only(top: 10, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorResource.black,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      S.of(context).home_meditation,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: ColorResource.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  isPlay == true
                                      ? Container(
                                          margin: EdgeInsets.only(
                                            right: width * 0.45,
                                            top: 3,
                                            bottom: 3,
                                          ),
                                          child: Text('Continue listening to'),
                                        )
                                      : Container(),
                                  isPlay == true
                                      ? Container(
                                          height: 50,
                                          width: width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                            color: ColorResource.white,
                                            border: Border.all(
                                              color: ColorResource.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '<Title>',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            ColorResource.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      '10:00 / 15:00',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color:
                                                            ColorResource.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 5),
                                                child: SvgPicture.asset(
                                                  ImagePath.music_icon,
                                                  width: 42,
                                                  height: 42,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            content: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: homeScreenViewModel
                                    .meditationModelData.length,
                                // itemCount: meditationList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: (7.5 / 10),
                                ),
                                itemBuilder: (context, index) {
                                  MeditationsModel data = homeScreenViewModel
                                      .meditationModelData[index];
                                  return meditationItem(
                                      meditationsModel: data);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              CommonAppBar(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  image: ImagePath.appbarDrawerImage),
              (homeScreenViewModel.articleModelData.isEmpty ||
                      homeScreenViewModel.meditationModelData.isEmpty)
                  ? LoadingPage()
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listViewItem({ArticlesModel articleModelData}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: height * 0.01),
      child: Container(
        width: width * 0.88,
        decoration: BoxDecoration(
          color: ColorResource.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Image.memory(
                base64Decode(articleModelData.cover),
                height: 95,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: height * 0.0075),
                    child: Text(
                      articleModelData.title,
                      style: TextStyle(
                        fontSize: 19,
                        color: ColorResource.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.0),
                    child: Text(
                      articleModelData.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        color: ColorResource.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 15, top: height * 0.008),
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorResource.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget meditationItem({MeditationsModel meditationsModel}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          SlideLeftRoute(
            page: MeditationDetailsScreen(meditationsModel: meditationsModel),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            image: DecorationImage(
              image: NetworkImage(meditationsModel.background),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: height * 0.04),
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorResource.containerColor.withOpacity(0.6),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.network(
                    meditationsModel.imageIcon,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: Text(
                  '${(meditationsModel.length / 60).toStringAsFixed(2)} ${S.of(context).home_meditationPlayerTime}',
                  style: TextStyle(color: ColorResource.white),
                ),
              ),
              Expanded(
                child: Text(
                  meditationsModel.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorResource.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height* 0.023,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  isPlay = !isPlay;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: SvgPicture.asset(
                    ImagePath.music_icon,
                    width: 42,
                    height: 42,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
