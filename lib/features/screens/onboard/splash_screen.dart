import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    _route();
    super.initState();



  }
  void _route() {
    // final AuthController authController = Get.find<AuthController>();
    Timer(const Duration(seconds: 2), () async {
      Get.offNamed(RouteHelper.getOnboardingRoute());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff3b9bfe), Color(0xff235e95)],
              stops: [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            image: DecorationImage(image: AssetImage(Images.splashScreenBG),fit: BoxFit.cover)
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSize75),
              child: Image.asset(Images.logoWithText),
            ),
          ),
        ),
    );


  }
}
