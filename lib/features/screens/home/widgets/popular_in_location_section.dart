import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/widgets/custom_button.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class PopularInLocationSectionSection extends StatelessWidget {
  const PopularInLocationSectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PropertyController>().getPropertyList(page: '1');
    });
    return Padding(
      padding: const EdgeInsets.only(left:Dimensions.paddingSizeDefault,top:Dimensions.paddingSizeDefault,
        bottom:Dimensions.paddingSizeDefault,),
      child: GetBuilder<PropertyController>(builder: (propertyControl) {
        final list = propertyControl.propertyList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = propertyControl.isPropertyLoading;
        return  isListEmpty && !isLoading
            ? Padding(
          padding: const EdgeInsets.only(top: Dimensions.paddingSize100),
          child: Center(
              child: EmptyDataWidget(
                image: Images.emptyDataImage,
                fontColor: Theme.of(context).disabledColor,
                text: 'No Popular Properties yet',
              )),
        ) :
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Popular In Location",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
            sizedBox12(),
            SizedBox(
              height: Get.size.height * 0.28,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list!.length > 6 ? 6 : list.length,
                itemBuilder: (_,i) {
                  return RecommendedItemCard(
                    image: list[i].displayImage!.image.toString(),
                    title: list[i].title.toString(),
                    description: list[i].description.toString(),
                    price: '₹ ${list[i].price.toString()}',
                    routeTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves",'')),);
                }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
            )
          ],);
      }),
    );
  }
}
