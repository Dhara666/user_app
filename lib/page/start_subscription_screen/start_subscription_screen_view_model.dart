import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:meditation_twoplus/common/widget/common_snackbar.dart';
import 'package:meditation_twoplus/common/widget/slide_left_route.dart';
import 'package:meditation_twoplus/page/home_screen/home_screen.dart';
import 'package:meditation_twoplus/page/start_subscription_screen/start_subscription_screen.dart';
import 'package:meditation_twoplus/services/user_service.dart';

class StartSubscriptionScreenViewModel {
  StartSubscriptionScreenState startSubscriptionScreenState;
  StreamSubscription<List<PurchaseDetails>> streamSubscription;
  List<ProductDetails> availableProducts = [];
  String inPurchaseProcessId = '';

  StartSubscriptionScreenViewModel(this.startSubscriptionScreenState) {
    inAppPurchaseStream();
    getProducts();
  }

  void inAppPurchaseStream() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        InAppPurchase.instance.purchaseStream;
    streamSubscription = purchaseUpdated.listen((purchaseDetailsList) {
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      streamSubscription.cancel();
      print('Done inAppPurchaseStream.!');
    }, onError: (error) {
      print('Error inAppPurchaseStream.!');
    });
  }

  void listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.pendingCompletePurchase) {
        print('Move to Complete pending purchase..!');
        await InAppPurchase.instance.completePurchase(purchaseDetails);
        print('Completed pending purchase..!');
      }
    });
  }

  getProducts() async {
    Set<String> _kIds;
    Platform.isIOS
        ? _kIds = <String>{'android.test.purchased'}
        : _kIds = <String>{'android.test.purchased'};
    print('Kids --> $_kIds');
    final ProductDetailsResponse response =
        await InAppPurchase.instance.queryProductDetails(_kIds);
    print('Purchase Product details --> ${response.productDetails}');
    if (response.notFoundIDs.isNotEmpty) {
      print('Purchase Not Found Ids --> ${response.notFoundIDs}');
      commonSnackBar(
        context: startSubscriptionScreenState.context,
        text: '${response.notFoundIDs}',
        label: 'Go Home?',
        onPressed: () {
          Navigator.push(
            startSubscriptionScreenState.context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
      );
    }
    availableProducts = response.productDetails;
  }

  meditationProductStatus() async {
    final PurchaseParam purchaseParam = PurchaseParam(
      productDetails: availableProducts[0],
      applicationUserName: 'Sagar tests',
    );
    bool isDone = await InAppPurchase.instance.buyConsumable(
      purchaseParam: purchaseParam,
      autoConsume: true,
    );
    if (isDone) {
      print('Product status --> Product available');
      inAppPurchaseHandler();
    } else {
      print('Product status --> Product not available');
    }
  }

  inAppPurchaseHandler() {
    final Stream updatePurchaseStream = InAppPurchase.instance.purchaseStream;
    streamSubscription = updatePurchaseStream.listen(
      (purchases) async {
        print('Purchases --> $purchases');
        for (PurchaseDetails purchaseDetails in purchases) {
          print('Purchase Status --> ${purchaseDetails.status}');
          if (purchaseDetails.status == PurchaseStatus.error &&
              purchaseDetails.error.message == 'Product already consumed.!') {
            print('Error --> ${purchaseDetails.error.message}');
          } else {
            if (purchaseDetails.productID.toLowerCase() ==
                inPurchaseProcessId.toLowerCase()) {
              print('Purchase Status --> ${purchaseDetails.status}');
              print('Purchased index --> ${PurchaseStatus.purchased.index}');
              if (purchaseDetails.productID.toLowerCase() ==
                      inPurchaseProcessId.toLowerCase() &&
                  purchaseDetails.status.index ==
                      PurchaseStatus.purchased.index) {
                print('completePurchase');
                if (Platform.isIOS) {
                  InAppPurchase.instance.completePurchase(purchaseDetails);
                }
              }
            }
          }
          if (purchaseDetails.status == PurchaseStatus.pending) {
            print('Purchase Status --> ${purchaseDetails.status}');
          } else {
            if (purchaseDetails.status == PurchaseStatus.error) {
              print('Purchase Status --> ${purchaseDetails.status}');
            } else if (purchaseDetails.status == PurchaseStatus.purchased) {
              print('Purchase Status --> ${purchaseDetails.status}');
              print('productID purchased --> ${purchaseDetails.productID}');
              UserService().isPurchaseTrue();
              Navigator.pushAndRemoveUntil(
                startSubscriptionScreenState.context,
                SlideLeftRoute(page: HomeScreen()),
                    (route) => false,
              );
            }
          }
        }
        // ignore: invalid_use_of_protected_member
        startSubscriptionScreenState.setState(() {
          startSubscriptionScreenState.isLoading = false;
        });
      },
    );
  }
}
