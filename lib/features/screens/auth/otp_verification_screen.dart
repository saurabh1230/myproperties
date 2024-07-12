import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class OtpVerificationScreen extends StatelessWidget {
   OtpVerificationScreen({super.key});
  final _otpController = TextEditingController();
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
                if(_otpController.text.length != 4) {
                  showCustomSnackBar('Please enter valid Otp', isError: true);
                } else {
                  Get.find<AuthController>().loginType == 0?
                  Get.toNamed(RouteHelper.getDashboardRoute()) :
                  Get.toNamed(RouteHelper.getAdminDashboardRoute());

                }
                },)
            ],
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(Images.authBgImage),
              alignment: Alignment.topCenter,)
        ),
        child:  Align(alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  sizedBox100(),
                  sizedBox100(),
                  Text("OTP Verification",style: senExtraBold.copyWith(color: Theme.of(context).primaryColor,
                      fontSize: Dimensions.fontSize32)),
                  sizedBoxDefault(),
                  Text("Enter OTP",style: senBold.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.60),fontSize: Dimensions.fontSize15),),
                  sizedBox4(),
                  Text("We have send verification code to you number",style: senRegular.copyWith(color: Theme.of(context).disabledColor.withOpacity(0.40),fontSize: Dimensions.fontSize13),),
                  sizedBox20(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize25),
                    child: PinCodeTextField(
                      length: 4,
                      appContext: context,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.slide,
                      controller: _otpController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 50,
                        fieldWidth: 50,
                        borderWidth: 1,
                        activeBorderWidth: 1,
                        inactiveBorderWidth:1,
                        errorBorderWidth: 1,
                        selectedBorderWidth: 1,
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        selectedColor: Theme.of(context).primaryColor.withOpacity(0.1),
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        inactiveColor:Theme.of(context).primaryColor,
                        activeColor: Theme.of(context).primaryColor,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (val){},
                      beforeTextPaste: (text) => true,
                    ),
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: RichText(
                      text:  TextSpan(
                        children: [
                          TextSpan(
                            text: "If you didn’t receive a code. ",
                            style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
                          ),
                          TextSpan(
                            text: " Resend",
                            style: senBold.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).hintColor), // Different color for "resend"
                          ),
                        ],
                      ),
                    ),
                  ),




                ],
              ),
            )),
      ),

    );
  }
}
