import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/explore_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_dropdown_button.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/features/widgets/group_radio_buttons.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class LocationBottomSheet extends StatelessWidget {
   LocationBottomSheet({super.key});

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.80,
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Select A City",
                      style:
                      senBold.copyWith(fontSize: Dimensions.fontSize18),
                    ),
                    Text("To Read Ratings & Reviews Of That City",
                      style:
                      senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.50)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: GetBuilder<ExploreController>(builder: (controller) {
                return  Padding(
                    padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SearchField(
                        //   tap: () {
                        //
                        //
                        //   },
                        //   onChanged: (value) {
                        //   },
                        //   onSubmitted: (value) {
                        //   }, controller: _searchController,
                        // ),
                        sizedBoxDefault(),
                        ListView.separated(
                          itemCount: 10,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_,i) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize4),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Text("Kolkata", style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor.withOpacity(0.50)),
                                      ),
                                  Icon(Icons.arrow_forward)
                                ],),
                              ),
                              // Divider(),
                            ],
                          );
                        }, separatorBuilder: (BuildContext context, int index) => Divider(),)


                      ],
                    ));
              }),
            ),
          ),
        ],
      ),
    );
  }
}
