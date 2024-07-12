import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/widgets/custom_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class SaleAndRentPropertySection extends StatelessWidget {
  final String type;
  const SaleAndRentPropertySection({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault,),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Looking for $type (10)',style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          sizedBox12(),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_,i) {
                return RecommendedItemCard(
                  vertical: true,
                  routeTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),
                  image: 'assets/images/recommended_property.png',
                  title: 'Natural Aqua Waves',
                  description: '2,3 BHK Apartment in New Town, Kolkata East',
                  price: '₹ 1.9 Cr',
                  tap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),);
              }, separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimensions.paddingSizeDefault,),),
          )
        ],),
    );
  }
}
