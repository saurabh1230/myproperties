import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/features/widgets/custom_textfield.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomButtonWidget(buttonText: "Continue",
                onPressed: () {
                if(_phoneController.text.isEmpty) {
                  showCustomSnackBar('Please enter mobile no to continue', isError: true);
                } else if (_phoneController.text.length  != 10) {
                  showCustomSnackBar('Please enter valid mobile no', isError: true);
                }
                else {
                  Get.toNamed(RouteHelper.getOtpVerificationRoute());                }
                },)
            ],
          ),
        ),
      ),
      body: GetBuilder<AuthController>(builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.authBgImage), // Replace with your image path
              fit: BoxFit.contain,
              alignment: Alignment.topCenter, // Aligns the image to the top center
            ),
          ),
          child: Align(alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sizedBox100(),
                    sizedBox100(),
                    Text("Login / Register",style: senExtraBold.copyWith(color: Theme.of(context).primaryColor,
                        fontSize: Dimensions.fontSize32)),
                    sizedBoxDefault(),
                    Text("Enter Your Phone Number",style: senBold.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.60),fontSize: Dimensions.fontSize15),),
                    sizedBox4(),
                    Text("You'll get a verification code from us.",style: senRegular.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.40),fontSize: Dimensions.fontSize13),),
                    sizedBox12(),
                    CustomTextField(
                      isNumber: true,
                      inputType: TextInputType.number,
                      controller: _phoneController,
                      isPhone: true,
                      hintText: "Enter your mobile number here",
                    ),
                    sizedBox20(),
                    Center(child: Text("Login As",style: senBold.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.60),fontSize: Dimensions.fontSize15),)),
                    sizedBoxDefault(),
                    Center(
                      child: Wrap(
                        spacing: 8.0, // Space between chips
                        runSpacing: 8.0, // Space between lines of chips
                        children: List.generate(
                          controller.loginTypeList.length,
                          // Assuming you have 2 buttons
                              (index) {
                            return CustomSelectedButton(
                              tap: () {
                                controller.selectLoginType(index);
                              },
                              title: controller.loginTypeList[index],
                              isSelected: controller.loginType == index,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),


    );
  }
}
