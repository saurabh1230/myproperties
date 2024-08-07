import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.size.width,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize20,horizontal: Dimensions.paddingSizeDefault),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radius20),
                    bottomRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(onTap: () {
                          Get.back();
                        },
                            child: Icon(Icons.arrow_back,color: Theme.of(context).cardColor,)),
                        sizedBoxW10(),
                        Text("Welcome",style: senRegular.copyWith(fontSize: Dimensions.fontSize18, color: Theme.of(context).cardColor),),
                        const Spacer(),
                        CustomNotificationButton(
                          icon: Icons.person,
                          tap: () {},
                        ),
                      ],
                    ),
                    sizedBoxDefault(),
                    CustomButtonWidget(color: Theme.of(context).cardColor,
                      isBold: false,
                      fontSize: Dimensions.fontSize15,
                      buttonText: "Register",onPressed: () {},
                    textColor: Theme.of(context).primaryColor)
                  ],
                ),
              ),
              sizedBox10(),
              Get.find<AuthController>().loginType == 0 ? const SizedBox() :
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Post Property",style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor),),
                    IconButton(onPressed: () {  },
                      icon: const Icon(Icons.add),
                      color: Theme.of(context).primaryColor,)
                  ],
                ),
              ),sizedBoxDefault(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Property For Sale",style: senBold.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.30)),),
                        buildContainer(context,"Apartment",tap : () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("Sale", "Apartment"));
                        }),
                        buildContainer(context,"House", tap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("Sale", "House"));
                        }),
                        buildContainer(context,"Land/ Plot", tap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("Sale", "Land/ Plot"));
                        }),
                        sizedBoxDefault(),
                        Text("Property For Rent",style: senBold.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.30)),),
                        buildContainer(context,"Apartment", tap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("Rent", "Apartment"));
                        }),
                        buildContainer(context,"House", tap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("Rent", "House"));
                        }),
                        buildContainer(context,"Land/ Plot", tap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute("rent", "Land/ Plot"));
                        }),
                        sizedBoxDefault(),
                        Text("Explore",style: senBold.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.30)),),
                        buildContainer(context,"Near Locality", tap: () {
                          Get.toNamed(RouteHelper.getExploreSearchRoute("Near Locality"));
                        }),
                        buildContainer(context,"Newly Constructed", tap: () {
                          Get.toNamed(RouteHelper.getExploreSearchRoute("Newly Constructed"));
                        }),
                        buildContainer(context,"Featured Properties", tap: () {
                          Get.toNamed(RouteHelper.getExploreSearchRoute("Featured Properties"));
                        }),
                        sizedBoxDefault(),
                        Text("Our Services",style: senBold.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.30)),),
                        buildContainer(context,"Home Inspection", tap: () {  }),
                        buildContainer(context,"Rent Agreement", tap: () {  }),
                        buildContainer(context,"Tenant Verification", tap: () {  }),
                        buildContainer(context,"Property Valuation", tap: () {  }),
                        buildContainer(context,"Recent Searches", tap: () {
                          Get.toNamed(RouteHelper.getSearchRoute());

                        }),
                        buildContainer(context,"Rating & Reviews", tap: () {Get.toNamed(RouteHelper.getRatingsAndReviewRoute());}),
                        buildContainer(context,"Terms & Conditions", tap: () {  }),
                        buildContainer(context,"Help Center", tap: () {  }),
                        sizedBoxDefault(),
                        CustomButtonWidget(
                          isBold: false,
                          buttonText: "LogOut",fontSize: Dimensions.fontSize14,
                          onPressed: () {Get.toNamed(RouteHelper.getSignUpRoute());},),
                        sizedBox30()
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }

  InkWell buildContainer(BuildContext context,String title,  {required  Function() tap}) {
    return InkWell(
      onTap:  tap,
      child: Container(width: Get.size.width,
                  margin: const EdgeInsets.only(top: Dimensions.paddingSize10),
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize10,horizontal: Dimensions.paddingSize10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius5),
                   color: Theme.of(context).primaryColor.withOpacity(0.04)),
                  child: Text(title,style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).disabledColor))),
    );
  }
}
