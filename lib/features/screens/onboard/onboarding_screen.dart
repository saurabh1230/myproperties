import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome to",style: senMedium.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.30)),),
              Text("GetMyProperties",style: senSemiBold.copyWith(color: Theme.of(context).hintColor,
              fontSize: Dimensions.fontSize30),),
              sizedBox30(),
              CustomButtonWidget(buttonText: "Continue",
              onPressed: () {
                Get.toNamed(RouteHelper.getSignUpRoute());
              },)
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.onboardingBg),fit: BoxFit.cover)
        ),
      ),
    );
  }
}
