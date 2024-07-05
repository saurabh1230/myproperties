import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/widgets/custom_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class PopularInLocationSectionSection extends StatelessWidget {
  const PopularInLocationSectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:Dimensions.paddingSizeDefault,top:Dimensions.paddingSizeDefault,
        bottom:Dimensions.paddingSizeDefault,),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular In Location",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          sizedBox12(),
          SizedBox(
            height: Get.size.height * 0.28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_,i) {
                return RecommendedItemCard(
                  image: 'assets/images/recommended_property.png',
                  title: 'Natural Aqua Waves',
                  description: '2,3 BHK Apartment in New Town, Kolkata East',
                  price: '₹ 1.9 Cr',
                  tap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),
                  routeTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),);
              }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
          )
        ],),
    );
  }
}
