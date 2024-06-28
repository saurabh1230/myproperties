import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class BrowseOtherConstructionsSection extends StatelessWidget {
  const BrowseOtherConstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:Dimensions.paddingSizeDefault, bottom:Dimensions.paddingSizeDefault, left:Dimensions.paddingSizeDefault, ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Browse Other Constructions",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          sizedBox12(),
          SizedBox(
            height: Get.size.height * 0.28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_,i) {
                return RecommendedItemCard(
                  routeTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),
                  image: 'assets/images/recommended_property.png',
                  title: 'Natural Aqua Waves',
                  description: '2,3 BHK Apartment in New Town, Kolkata East',
                  price: '₹ 1.9 Cr',
                  tap: () {  },);
              }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
          )
        ],),
    );
  }
}
