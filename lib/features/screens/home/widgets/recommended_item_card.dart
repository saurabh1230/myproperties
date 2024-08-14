import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_image_widget.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class RecommendedItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final Function() routeTap;
  // final Function() tap;
  final bool? vertical;
  const RecommendedItemCard({super.key, required this.image, required this.title, required this.description, required this.price,/* required this.tap, */required this.routeTap,  this.vertical = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: routeTap,
      child: Container(
        width: vertical! ? Get.size.width : 220,
        padding:  EdgeInsets.only(right:vertical! ? 0 : Dimensions.paddingSizeDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 126,width:vertical! ? Get.size.width : 220,
              child: CustomNetworkImageWidget(
                radius: Dimensions.radius5,
                  image: '${AppConstants.imgBaseUrl}${image}'),
            ),
            sizedBox8(),
            Text(title,style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault,),maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text(description,style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).disabledColor.withOpacity(0.50)),
              maxLines: 2,overflow: TextOverflow.ellipsis,),
            sizedBox8(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(price,style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).hintColor),)),
                Expanded(
                  child: CheckoutArrowButton(tap: routeTap,),
                )
              ],)
          ],
        ),
      ),
    );
  }
}
