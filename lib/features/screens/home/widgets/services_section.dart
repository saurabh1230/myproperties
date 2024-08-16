import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/home_controller.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/custom_shimmer_holders.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical:Dimensions.paddingSizeDefault ),
        child: (controller.servicesNames ?? []).isEmpty
            ? const SizedBox()
            :
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Services",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
            sizedBoxDefault(),
            SizedBox(height: Get.size.height * 0.24,
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: Dimensions.paddingSizeDefault, // Horizontal spacing between columns
                    mainAxisSpacing: Dimensions.paddingSizeDefault, // Vertical spacing between rows
                    childAspectRatio: 1.8, // Aspect ratio of each item
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.servicesNames.length,
                  itemBuilder: (_, i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(Dimensions.radius10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(controller.servicesImages[i], height: 36),
                          const SizedBox(height: 4),
                          Text(
                            controller.servicesNames[i],
                            style: senRegular.copyWith(
                              fontSize: Dimensions.fontSize12,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),


          ],
        ),
      );
    });

  }
}

class ServicesShimmer extends StatelessWidget {
  const ServicesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Services",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
        sizedBoxDefault(),
        SizedBox(height: Get.size.height * 0.24,
          child: Container(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: Dimensions.paddingSizeDefault, // Horizontal spacing between columns
                mainAxisSpacing: Dimensions.paddingSizeDefault, // Vertical spacing between rows
                childAspectRatio: 1.8, // Aspect ratio of each item
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (_, i) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(Dimensions.radius10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Column(
                    children: [
                      PrimaryCardContainer(
                      color: Colors.black.withOpacity(0.1),
                        width: 100,
                        onTap: () {
                        },
                        child: const SizedBox()
                                        ),
                      CustomShimmerTextHolder(
                        width: 40,
                        horizontalPadding: 0,
                      ),
                    ],
                  ),
                      const SizedBox(height: 4),

                    ],
                  ),
                );
              },
            ),
          ),
        ),


      ],
    );
  }
}
