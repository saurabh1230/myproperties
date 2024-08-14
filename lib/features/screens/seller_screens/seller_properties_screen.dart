import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/explore/widgets/explore_card_widget.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get/get.dart';
class SellerPropertiesScreen extends StatelessWidget {
   SellerPropertiesScreen({super.key});
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: "My Properties",isBackButtonExist: false,),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomOutlineButton(tap: () {}, title: "Sortlisted",filter: true,filterText: "(2)",),
              CustomOutlineButton(tap: () {}, title: "Features",filter: true,filterText: "(4)",),
              CustomOutlineButton(tap: () {}, title: "Pending",filter: true,filterText: "(0)",)
            ],
          ),
          sizedBox8(),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, i) {
                  return ExploreCardWidget(
                      itemCount: 10,
                      image: "assets/images/exploreimage1.png",
                      ratingText: "4.2",
                      imagesLength: "4",
                      likeTap: () {},
                      detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent",'')),
                      propertyCategory: "Apartment",
                      title: 'La Convent',
                      description: '3,4 BHK Apartment in Entally, Kolkata Central',
                      price: '₹ 2.9 - 3.6 Cr',
                      // pageController: _pageController
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: Dimensions.paddingSizeDefault),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
