import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/home_controller.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class SuitablePropertySection extends StatelessWidget {
  const SuitablePropertySection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GetBuilder<AuthController>(builder: (authControl) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
          child: Center(
            child: Column(
              children: [
                sizedBox12(),
                Text("Welcome to GetMyProperties",style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
                sizedBox4(),
                Text("We will help you find your suitable property",style: senRegular.copyWith(fontSize: Dimensions.fontSize12,
                    color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                sizedBox30(),
                SizedBox(
                  height: Get.size.height * 0.10,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: authControl.homeData!.propertyTypes!.length,
                    itemBuilder: (_,i) {
                      return PrimaryCardContainer(width: 100,
                        onTap: () {
                          Get.toNamed(RouteHelper.getSellAndRentDashboardRoute(
                              "Sale",
                              authControl.homeData!.propertyTypes![i].name.toString(),
                              authControl.homeData!.propertyTypes![i].sId.toString(),
                              '66b097948e94ad0e435526ee'
                            // authControl.homeData!.propertyPurposes![i].sId.toString(),
                          ));
                        },
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(controller.suitablePropertyImages[i],height: 36,),
                            sizedBox4(),
                            Text(authControl.homeData!.propertyTypes![i].name.toString(),style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).primaryColor),),
                          ],
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
                )
              ],
            ),

          ),
        );

      } );

    } );
  }
}
