import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/explore/explore_screen.dart';
import 'package:get_my_properties/features/screens/explore/widgets/explore_card_widget.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get/get.dart';
class SellerPropertiesScreen extends StatelessWidget {
   SellerPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PropertyController>().getVendorPropertyList(page: '1',
          );
    });
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: "My Properties",isBackButtonExist: false,),
      body: GetBuilder<PropertyController>(builder: (propertyControl) {
        final list = propertyControl.propertyList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = propertyControl.isPropertyLoading;
        return
          isLoading ||isListEmpty ? const ExploreScreenShimmer() :


          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomOutlineButton(tap: () {}, title: "Sortlisted",filter: true,filterText: "(2)",),
                    CustomOutlineButton(tap: () {}, title: "Features",filter: true,filterText: "(4)",),
                    CustomOutlineButton(tap: () {}, title: "Pending",filter: true,filterText: "(0)",)
                  ],
                ),
              ),
              sizedBox8(),
              isListEmpty && !isLoading
                  ? Center(
                  child: EmptyDataWidget(
                    image: Images.emptyDataImage,
                    fontColor: Theme.of(context).disabledColor,
                    text: 'No Properties yet',
                  )) :
              Expanded(
                child: SingleChildScrollView(
                  child:
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, i) {
                      return
                        RecommendedItemCard(
                          vertical: true,
                          image: list[i].displayImage!.image.toString(),
                          title:  list[i].title.toString(),
                          description:  list[i].description.toString(),
                          price: '₹ ${list[i].price.toString()}',
                          propertyId: list[i].sId.toString(),
                          ratingText: '4.5',likeTap:() {},
                        );
                      // return ExploreCardWidget(
                      //     itemCount: 10,
                      //     image:  list[i].displayImage!.image.toString(),
                      //     ratingText: "4.2",
                      //     imagesLength:  list[i].galleryImages!.length.toString(),
                      //     likeTap: () {},
                      //     detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent",'')),
                      //     propertyCategory:  list[i].category!.name.toString(),
                      //     title:  list[i].title.toString(),
                      //     description: list[i].description.toString(),
                      //     price: '₹ ${list[i].price.toString()}',
                      //     // pageController: _pageController
                      // );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimensions.paddingSizeDefault),
                  ),
                ),
              ),
            ],
          );
      }),
    );
  }
}
