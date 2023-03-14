import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_twoplus/model/user_model/user_model.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen.dart';
import 'package:meditation_twoplus/page/landing_screen/landing_screen.dart';
import 'package:meditation_twoplus/services/user_service.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  UserModel isUser;
  var user;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Current Screen --> $runtimeType');
    return Scaffold(body: Container());
  }

  getCurrentUser() async {
    UserService userService = UserService();
    List<UserModel> userList = await userService.getUserList();
    if (user != null) {
      isUser = userList.firstWhere((value) => value.userID == user.uid,
          orElse: () => null);
      setState(() {});
    }
    await getScreen();
  }

  getScreen() {
    if (isUser != null && isUser.isPurchase == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingScreen()));
    }
  }
}
