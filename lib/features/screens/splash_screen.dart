


import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:janseva/controllers/auth_controller.dart';
import 'package:janseva/features/screens/auth/welcome_screen.dart';
import 'package:janseva/features/widgets/commons.dart';
import 'package:janseva/features/widgets/scaffold_bg_widget.dart';
import 'package:janseva/utils/dimensions.dart';

import '../../../helper/route_helper.dart';
import '../../../utils/images.dart';
import '../../widgets/custom_snackbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    _route();
    // initializeFirebaseService();
    super.initState();



  }

  // String _fcmToken = '';
  // Future<void> initializeFirebaseService() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //
  //   String firebaseAppToken = await messaging.getToken(
  //     vapidKey: "BNcGB3Ddrz-QYg4SsYfibhz4O9mkILCnbFS5ehPJcHucVFBx4aGIcoJTL_btyvvZCT_ZfRuQ1s-yNgFQ0_j8wFU",) ?? '';
  //   if (!mounted) {
  //     _fcmToken = firebaseAppToken;
  //   } else {
  //     setState(() {
  //       _fcmToken = firebaseAppToken;
  //     });
  //   }
  //
  //   // var prefs = await SharedPreferences.getInstance();
  //   // prefs.setString(Keys().fcmToken, _fcmToken);
  //   // fcmToken();
  //   print('Firebase token: ==============>>>> $_fcmToken');
  //   //NotificationTokenApi().get();
  // }


  // Future<void> fcmToken() async  {
  //   Get.find<AuthController>().fcmTokenApi(_fcmToken);
  //
  // }







  void _route() {
    // final AuthController authController = Get.find<AuthController>();
    // Timer(const Duration(seconds: 1), () async {
    //   if (Get.find<AuthController>().isLoggedIn()) {
    //     Get.offNamed(RouteHelper.getMainRoute());
    //   } else {
    //     Get.offNamed(RouteHelper.getSignInRoute());
    //   }
    // });
  }

/*  void _route() {
    GetBuilder<AuthController>(
      builder: (authController) {
        Future.delayed(const Duration(seconds: 1), () async {
          final status = await authController.login(authController.loginResponse!.data!.user!.username.toString(), password);
          if (status != null) {
            if (status.isSuccess) {
              Get.offAllNamed(RouteHelper.getMainRoute());
            } else {
              Get.offNamed(RouteHelper.getSignInRoute());
              showCustomSnackBar("Login Failed", isError: true);
            }
          }
        });

        // Placeholder widget since GetBuilder requires a widget to be returned
        return const SizedBox.shrink();
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body:Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSize30),
          child: SvgPicture.asset(Images.logo,
            width: 170,
          ),
        ),



    );
  }
}
