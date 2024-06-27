import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_textfield.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading:InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            padding:  const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Image.asset(Images.drawerMenuIcon,height: 24,width: 24,),
          ),
        ) ,
        title:Text("Profile",style: senRegular.copyWith(fontSize: Dimensions.fontSize18, color: Theme.of(context).cardColor),) ,
        actions: [Padding(
          padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
          child: CustomNotificationButton(
            tap: () {},
          ),
        )],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius20),
                      bottomRight: Radius.circular(Dimensions.radius20),
                    )
                  ),),
                  Container(
                    height: 80,
                  ),
                ],
              ),
              Positioned(bottom: 0,left: 0,right: 0,
                  child: ClipOval(child: Image.asset("assets/images/profile_person.png",height: 150,)))

            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    const CustomTextField(
                      showTitle: true,
                      hintText: "Name",
                      editText: true,),
                    sizedBoxDefault(),
                    const CustomTextField(
                      showTitle: true,
                      hintText: "Registered As",
                      editText: true,),
                    sizedBoxDefault(),
                    const CustomTextField(
                      showTitle: true,
                      hintText: "Email Address",
                      editText: true,),
                    sizedBoxDefault(),
                    const CustomTextField(
                      showTitle: true,
                      hintText: "Email Address",
                      editText: true,),
                    sizedBoxDefault(),
                    const CustomTextField(
                      showTitle: true,
                      hintText: "Password",
                      isPassword: true,),
                    sizedBoxDefault(),
                    OutlinedButton(onPressed: () {}, child: Padding(
                      padding:  const EdgeInsets.symmetric(vertical: Dimensions.paddingSize12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("History",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor),),
                          const Icon(Icons.arrow_forward)

                        ],
                      ),
                    )),
                    sizedBoxDefault(),
                    CustomButtonWidget(
                      onPressed: () {},
                        buttonText: "Save Changes")
                  ],
                ),
              ),
            ),
          )
        ],
      ),



    );
  }
}
