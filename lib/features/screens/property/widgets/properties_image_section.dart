import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:get_my_properties/controller/properties_controller.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:get_my_properties/utils/dimensions.dart';

class PropertiesImageSection extends StatelessWidget {
  final List<GalleryImages> galleryImages;

  const PropertiesImageSection({super.key, required this.galleryImages});

  @override
  Widget build(BuildContext context) {
    // Map the galleryImages to full URLs
    final fullImageUrls = galleryImages
        .map((image) => '${AppConstants.imgBaseUrl}${image.image}')
        .toList();

    return GetBuilder<PropertiesController>(builder: (controller) {
      return
        FanCarouselImageSlider.sliderType2(
        indicatorActiveColor: Theme.of(context).primaryColor,
        imagesLink: fullImageUrls, // Use the mapped list of URLs
        isAssets: false,
        autoPlay: false,
        sliderHeight: 300,
        currentItemShadow: const [],
        sliderDuration: const Duration(milliseconds: 200),
        imageRadius: Dimensions.radius20,
        slideViewportFraction: 1.2,
      );
    });
  }
}
