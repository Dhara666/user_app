import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/model/user_model/user_model.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen.dart';
import 'package:meditation_twoplus/page/log_in/log_in_screen.dart';
import 'package:meditation_twoplus/page/start_subscription_screen/start_subscription_screen.dart';
import 'package:meditation_twoplus/services/auth_service.dart';
import 'package:meditation_twoplus/services/user_service.dart';

class LoginScreenViewModel {
  LoginScreenState state;
  AuthServices authServices = AuthServices();
  UserService userService = UserService();
  bool isLoading = false;

  LoginScreenViewModel(this.state);

  Future<void> onTapFacebookLogin() async {
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential = await authServices.signInWithFacebook();
      if (userCredential != null) {
        print('FB Account Details --> ${userCredential.user.email}');
        List<UserModel> userList = await userService.getUserList();
        UserModel isUser = userList.firstWhere(
            (value) => value.userID == userCredential.user.uid,
            orElse: () => null);
        if (isUser != null && isUser.isPurchase == true) {
          Navigator.pushAndRemoveUntil(
            state.context,
            SlideLeftRoute(page: HomeScreen()),
            (route) => false,
          );
        } else {
          UserModel userModel = UserModel(
              email: userCredential.user.email,
              userID: userCredential.user.uid,
              firstName: userCredential.user.displayName,
              isPurchase: false,
              type: "facebook");
          await userService.createUser(userModel);
          // ignore: invalid_use_of_protected_member
          state.setState(() {
            isLoading = false;
          });
          Navigator.pushAndRemoveUntil(
            state.context,
            SlideLeftRoute(page: StartSubscriptionScreen()),
            (route) => false,
          );
        }
        // ignore: invalid_use_of_protected_member
        state.setState(() {
          isLoading = false;
        });
      } else {
        // ignore: invalid_use_of_protected_member
        state.setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      // ignore: invalid_use_of_protected_member
      state.setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  Future onTapGoogleSignIn() async {
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      isLoading = true;
    });
    UserCredential userCredential = await authServices.signInWithGoogle();
    if (userCredential != null) {
      print('Google Account Details --> ${userCredential.toString()}');
      List<UserModel> userList = await userService.getUserList();
      UserModel isUser = userList.firstWhere(
          (value) => value.userID == userCredential.user.uid,
          orElse: () => null);
      if (isUser != null && isUser.isPurchase == true) {
        Navigator.pushAndRemoveUntil(
          state.context,
          SlideLeftRoute(page: HomeScreen()),
          (route) => false,
        );
      } else {
        UserModel userModel = UserModel(
            email: userCredential.user.email,
            userID: userCredential.user.uid,
            firstName: userCredential.user.displayName,
            isPurchase: false,
            type: "google");
        await userService.createUser(userModel);
        // ignore: invalid_use_of_protected_member
        state.setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(
          state.context,
          SlideLeftRoute(page: StartSubscriptionScreen()),
          (route) => false,
        );
      }
      // ignore: invalid_use_of_protected_member
      state.setState(() {
        isLoading = false;
      });
    } else {
      // ignore: invalid_use_of_protected_member
      state.setState(() {
        isLoading = false;
      });
    }
  }

  Future onTapEmailSignIn() async {
    // ignore: invalid_use_of_protected_member
    state.setState(() {
      isLoading = true;
    });
    UserCredential userCredential = await authServices.signInWithEmail(
      context: state.context,
      emailInput: state.emailOrPhoneController.text,
      passwordInput: state.passwordController.text,
    );
    if (userCredential != null) {
      print('EmailSignIn Account Details --> ${userCredential.toString()}');
      List<UserModel> userList = await userService.getUserList();
      UserModel isUser = userList.firstWhere(
          (value) => value.userID == userCredential.user.uid,
          orElse: () => null);
      if (isUser != null && isUser.isPurchase == true) {
        Navigator.pushAndRemoveUntil(
          state.context,
          SlideLeftRoute(page: HomeScreen()),
          (route) => false,
        );
      } else {
        // ignore: invalid_use_of_protected_member
        state.setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(
          state.context,
          SlideLeftRoute(page: StartSubscriptionScreen()),
          (route) => false,
        );
      }
      // ignore: invalid_use_of_protected_member
      state.setState(() {
        isLoading = false;
      });
    } else {
      // ignore: invalid_use_of_protected_member
      state.setState(() {
        isLoading = false;
      });
    }
  }
}

// bool isPayment = await getPrefBoolValue(is_purchase);
// print("payment-------->> $isPayment");
// if (isPayment == true) {
// print('Payment done--> $isPayment');
// Navigator.pushAndRemoveUntil(
// state.context,
// SlideLeftRoute(page: HomeScreen()),
// (route) => false,
// );
// } else {
// print('Payment --> $isPayment');
// Navigator.pushAndRemoveUntil(
// state.context,
// SlideLeftRoute(page: StartSubscriptionScreen()),
// (route) => false,
// );
// }
