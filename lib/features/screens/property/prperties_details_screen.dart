import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/properties_controller.dart';

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
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/styles.dart';

class PropertiesDetailsScreen extends StatelessWidget {
  final String? title;

  const PropertiesDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        isBackButtonExist: true,
        menuWidget: CustomNotificationButton(
          tap: () {},
        ),
      ),
      body: GetBuilder<PropertiesController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              // horizontal: Dimensions.paddingSizeDefault,
              vertical: Dimensions.paddingSizeDefault),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  Dimensions.paddingSizeDefault),
                child: Row(
                  children: [
                    Expanded(
                        child: PrefixIconButton(
                      tap: () {},
                      title: 'Contact Agent',
                    )),
                    sizedBoxW10(),
                    Expanded(
                        child: PrefixIconButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).cardColor,
                      tap: () {},
                      title: 'Inquire Now',
                    )),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PropertiesImageSection(),
                      sizedBoxDefault(),
                       PropertyDetailsSection(
                        propertyTitle: title!,
                          address: 'Building Address Here- Apartment in Entally, Kolkata Central',
                          price: '4.04 - 4.94 Cr',
                          propertyType: 'Appartment',
                          beds: '2',
                          bath: '3',
                          sqFt: '1520', floors: '10', HOA: '89/mo', city: 'Central City',),
                      const HighlightFactsSection(),
                      const FloorPlansPricingSection(),
                      const LocationAdvantageSection(),
                      EmiCalculator(),
                      const RatingAndReviewSection(),
                      const BrowseOtherConstructionsSection()

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
