import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/profile_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_image_widget.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/features/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class SignUpDetailsDialog extends StatelessWidget {
   SignUpDetailsDialog({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
   final _addressController = TextEditingController();
   final _usernameController = TextEditingController();
   final _websiteController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 1),
      child: GetBuilder<ProfileController>(builder: (profileControl) {
        return SingleChildScrollView(
          child: Container(width: MediaQuery.of(context).size.width * 0.9,
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Form(key:_formKey ,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome!',style: senBold.copyWith(fontSize: Dimensions.fontSize20,color: Theme.of(context).primaryColor),),
                  sizedBox10(),
                  Text('Fill Details to Start Posting Properties on GetMyProperties',
                    style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).disabledColor.withOpacity(0.70)),),
                  sizedBox20(),
                  Center(
                    child: Stack(
                      children:[ Container(
                        height: 90, width: 90,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(shape: BoxShape.circle,
                          border: Border.all(width: 0.5,
                            color: Theme.of(context).primaryColor.withOpacity(0.40),),
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                        ),
                        alignment: Alignment.center,
                        child:profileControl.pickedImage != null ? Image.file(
                          File(profileControl.pickedImage!.path,),height: 90, width: 90,  fit: BoxFit.cover,
                        ): Stack(
                          children: [
                            Container(color: Colors.white,
                                height: 90, width: 90,
                                child:
                                const CustomNetworkImageWidget(
                                  height: 40, width: 40,
                                  image: "",placeholder: Images.profilePlaceholder,)
                            ),

                            // Image.asset(Images.profilePlaceholder,)

                          ],
                        ),
                      ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          top: 0,
                          left: 0,
                          child: InkWell(
                            onTap: () => profileControl.pickImage(isRemove: false),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: Theme.of(context).primaryColor),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(25),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: Colors.white),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.camera_alt, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox12(),
                   CustomTextField(
                    controller: _nameController,
                    inputType: TextInputType.name,
                    capitalization: TextCapitalization.words,
                    showTitle: true,
                    hintText: "Name",
                     validation: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your full name';
                       } else if (RegExp(r'[^\p{L}\s]', unicode: true).hasMatch(value)) {
                         return 'Full name must not contain special characters';
                       }
                       return null;
                     },
                    editText: false,),
                  sizedBox12(),
                  CustomTextField(
                    controller: _usernameController,
                    inputType: TextInputType.name,
                    // capitalization: TextCapitalization.words,
                    showTitle: true,
                    hintText: "Username",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    editText: false,),
                  sizedBox12(),
                   CustomTextField(
                    controller: _emailController,
                    showTitle: true,
                    hintText: "Email",
                     validation: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your email';
                       } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                         return 'Please enter a valid email address';
                       }
                       return null;
                     },
                    editText: false,),
                  sizedBox12(),
                  CustomTextField(
                    controller: _addressController,
                    showTitle: true,
                    hintText: "Address",
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Address';
                      }
                      return null;
                    },
                    editText: false,),
                  // sizedBox12(),
                  // CustomTextField(
                  //   controller: _websiteController,
                  //   showTitle: true,
                  //   hintText: "Website Url (optional)",
                  //   editText: false,),
                  sizedBox40(),
                  profileControl.isLoading ?
                      const Center(child: CircularProgressIndicator()) :
                  CustomButtonWidget(
                    buttonText: 'Continue',
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {
                        if(profileControl.pickedImage != null) {
                          if (Get.find<AuthController>().isCustomerLoggedIn()) {
                            await profileControl.updateProfile(
                              name: _nameController.text,
                              email: _emailController.text,
                              address: '',
                              image: profileControl.pickedImage!,
                            );
                          } else {
                            await profileControl.updateVendorProfile(
                              name: _nameController.text,
                              email: _emailController.text,
                              address: _addressController.text,
                              image: profileControl.pickedImage!,
                              username: _usernameController.text,
                              websiteUrl: _websiteController.text,
                            );
                          }
                          Get.back();
                        }
                        else {
                          showCustomSnackBar("Please Add your Profile Picture");
                        }


                      }

                  },)
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
