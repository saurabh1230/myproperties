import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/properties_controller.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/Maps/property_location_map_component.dart';

import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/screens/property/widgets/browse_other_constructions.dart';
import 'package:get_my_properties/features/screens/property/widgets/calculate_emi_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/floor_plans_pricing_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/highlight_facts_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/location_advantage_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/properties_image_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/property_details_section.dart';
import 'package:get_my_properties/features/screens/property/widgets/rating_and_review_Section.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/styles.dart';

class PropertiesDetailsScreen extends StatelessWidget {
  final String? title;
  final String? propertyId;

  const PropertiesDetailsScreen({super.key, required this.title, this.propertyId});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PropertyController>().getPropertyDetailsApi(propertyId);

    });

    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isBackButtonExist: true,
        menuWidget: CustomNotificationButton(
          tap: () {},
        ),
      ),
      body: GetBuilder<PropertyController>(builder: (propertyControl) {
        final list = propertyControl.propertyDetails;
        final isListEmpty = list == null || list.galleryImages == null;
        final isLoading = propertyControl.isLoading;
        return isListEmpty && isLoading
            ? const Center(
                child: Center(child: CircularProgressIndicator())) :
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  Dimensions.paddingSizeDefault),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize8),
                  child: Row(
                    children: [
                      Expanded(
                          child: PrefixIconButton(
                        tap: () {
                          showCustomSnackBar('Currently in the development');
                        },
                        title: 'Contact Agent',
                      )),
                      sizedBoxW10(),
                      Expanded(
                          child: PrefixIconButton(
                        backgroundColor: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).cardColor,
                        tap: () {
                          showCustomSnackBar('Currently in the development');
                        },
                        title: 'Inquire Now',
                      )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       PropertiesImageSection(
                         galleryImages: list!.galleryImages!,),
                      sizedBoxDefault(),
                       PropertyDetailsSection(
                        propertyTitle: title!,
                          address: list.address.toString(),
                          price:  list.price.toString(),
                          propertyType:  list.typeId!.name.toString(),
                          beds: list.bedroom.toString(),
                          bath: list.bathroom.toString(),
                          sqFt: list.area.toString(),
                         floors:  list.floor.toString(),
                         HOA: '89/mo',
                         city:  list.cityId!.name.toString(),
                         propertyDesc:  list.description.toString(),),
                       HighlightFactsSection(
                        room: list.room.toString(),
                        space: list.space.toString(),
                        floor: list.floor.toString(),
                        kitchen: list.kitchen.toString(),
                        bedRoom: list.bedroom.toString(),
                        bathRoom:  list.bathroom.toString(),),
                      // const FloorPlansPricingSection(),
                      PropertyLocationMapComponent(longitude: list.longitude!, latitude: list.latitude!,),
                      // const LocationAdvantageSection(),
                      EmiCalculator(),
                      // const RatingAndReviewSection(),
                      const BrowseOtherConstructionsSection()

                    ],
                  ),
                ),
              ),
            ],
          );
      }),
    );
  }
}
