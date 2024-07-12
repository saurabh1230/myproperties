import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/screens/property/sale_and_rent_dashboard/sale_and_rent_property_section.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import '../../../utils/styles.dart';
import '../../widgets/custom_app_button.dart';
import '../../widgets/custom_buttons.dart';
import '../home/widgets/filter_bottom_sheet.dart';

class ExploreSearchScreen extends StatelessWidget {
  final String? title;
  const ExploreSearchScreen({Key? key,this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
      toolbarHeight: 80,
      flexibleSpace:  Padding(
        padding: const EdgeInsets.only(left:  Dimensions.paddingSizeDefault,right: Dimensions.paddingSizeDefault,bottom: Dimensions.paddingSizeDefault,top: Dimensions.paddingSize40),
        child: Row(
          children: [
            GestureDetector(
                onTap: () {Get.back();},
                child: Container(
                    padding: const EdgeInsets.all(Dimensions.paddingSize4),
                    decoration: BoxDecoration(shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,),
                    child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,))),
            sizedBoxW10(),
            Flexible(child: SearchField()),
          ],
        ),),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Row(
              children: [
                Expanded(
                  child: CustomOutlineButton(
                    title: 'Location',
                    tap: () {},
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CustomOutlineButton(
                    title: 'Filters',
                    filter: true,
                    filterText: "  (2)",
                    tap: () {
                      Get.bottomSheet(
                        const FilterBottomSheet(),
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                      );
                    },
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: CustomButtonWidget(
                    height: 35,
                    radius: Dimensions.radius5,
                    isBold: false,
                    buttonText: "Apply Filters",
                    onPressed: () {},
                    fontSize: Dimensions.fontSize12,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Text('Looking for $title (10)',style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          ),
          sizedBox12(),
          Expanded(
            child: SingleChildScrollView(
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: 10,
                      physics: const NeverScrollableScrollPhysics(),
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
