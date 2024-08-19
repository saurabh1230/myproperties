import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/explore_controller.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_dropdown_button.dart';
import 'package:get_my_properties/features/widgets/filter_data_field.dart';
import 'package:get_my_properties/features/widgets/group_radio_buttons.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().getHomeDataApi();
      // Get.find<PropertyController>().getPropertyList(page: '1',
      //
      // );
    });

    return Container(
      height: Get.size.height * 0.80,
      color: Theme.of(context).cardColor,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSize10),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        "${Get.find<PropertyController>().propertyList!.length.toString()} Results",
                        style: senBold.copyWith(fontSize: Dimensions.fontSize18),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: GetBuilder<ExploreController>(builder: (controller) {
                  return GetBuilder<AuthController>(builder: (authControl) {
                    return authControl.homeData == null
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(
                              Dimensions.paddingSizeDefault),
                          child: authControl.homeData == null
                              ? const Center(
                              child: CircularProgressIndicator())
                              : Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Property For",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              Wrap(
                                spacing: 8.0, // Space between chips
                                runSpacing: 8.0, // Space between lines of chips
                                children: List.generate(
                                  authControl.homeData!.propertyPurposes!.length,
                                      (index) {
                                    final val = authControl.homeData!.propertyPurposes![index];
                                    return CustomSelectedButton(
                                      tap: () {
                                        authControl.selectPropertyPurposeId(val.sId.toString());
                                        print(authControl.propertyPurposeID);
                                      },
                                      title: val.name.toString(),
                                      isSelected: authControl.propertyPurposeID == val.sId.toString(), // Compare String values
                                    );
                                  },
                                ),
                              ),
                              sizedBox20(),
                              Text(
                                "Property Type",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              Wrap(
                                spacing: 8.0, // Space between chips
                                runSpacing: 8.0, // Space between lines of chips
                                children: List.generate(
                                  authControl.homeData!.propertyTypes!.length,
                                      (index) {
                                    final propertyType = authControl.homeData!.propertyTypes![index];
                                    return CustomSelectedButton(
                                      tap: () {
                                        authControl.selectPropertyTypeId(propertyType.sId.toString());
                                        print(authControl.propertyTypeID);
                                      },
                                      title: propertyType.name.toString(),
                                      isSelected: authControl.propertyTypeID == propertyType.sId.toString(), // Compare String values
                                    );
                                  },
                                ),
                              ),
                              sizedBox20(),

                              Text(
                                "Space",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Any",
                                        style: senRegular.copyWith(
                                            color: Theme.of(context)
                                                .primaryColor),
                                      )),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 8.0, // Space between chips
                                      runSpacing: 8.0, // Space between lines of chips
                                      children: List.generate(
                                        controller.spaceType.length,
                                            (index) {
                                          final spaceType = controller.spaceType[index];
                                          return InkWell(
                                            onTap: () {
                                              controller.selectSpaceTypeID(spaceType);
                                              print(controller.spaceTypeID);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor.withOpacity(0.10),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: controller.spaceTypeID == spaceType
                                                      ? Theme.of(context).primaryColor
                                                      : Theme.of(context).primaryColor.withOpacity(0.10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  spaceType,
                                                  style: senRegular.copyWith(
                                                    color: controller.spaceTypeID == spaceType
                                                        ? Theme.of(context).primaryColor
                                                        : Theme.of(context).disabledColor.withOpacity(0.40),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )

                                ],
                              ),

                              sizedBox20(),
                              Text(
                                "Bathrooms",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Any",
                                        style: senRegular.copyWith(
                                            color: Theme.of(context)
                                                .primaryColor),
                                      )),
                                  Expanded(
                                    child: Wrap(
                                      spacing: 8.0, // Space between chips
                                      runSpacing: 8.0, // Space between lines of chips
                                      children: List.generate(
                                        controller.bathroomType.length,
                                            (index) {
                                          final spaceType = controller.bathroomType[index];
                                          return InkWell(
                                            onTap: () {
                                              controller.selectBathroomTypeID(spaceType);
                                              print(controller.bathroomID);
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context).primaryColor.withOpacity(0.10),
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: controller.bathroomID == spaceType
                                                      ? Theme.of(context).primaryColor
                                                      : Theme.of(context).primaryColor.withOpacity(0.10),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  spaceType,
                                                  style: senRegular.copyWith(
                                                    color: controller.bathroomID == spaceType
                                                        ? Theme.of(context).primaryColor
                                                        : Theme.of(context).disabledColor.withOpacity(0.40),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )

                                ],
                              ),
                              sizedBox20(),
                              Text(
                                "Other Options",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Min Value: ₹ ${controller.startPriceValue.value.round().toString()}',
                                        style: senRegular.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Max Value: ₹ ${controller.endPriceValue.value.round().toString()}',
                                        style: senRegular.copyWith(
                                          fontSize: Dimensions.fontSizeDefault,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Obx(() => RangeSlider(
                                  min: 0.0, // Minimum value
                                  max: 10000000.0, // Maximum value (1 crore)
                                  divisions: 100, // Number of divisions for finer granularity
                                  labels: RangeLabels(
                                    controller.formatCurrency(controller.startPriceValue.value),
                                    controller.formatCurrency(controller.endPriceValue.value),
                                  ),
                                  values: RangeValues(
                                    controller.startPriceValue.value,
                                    controller.endPriceValue.value,
                                  ),
                                  onChanged: (values) {
                                    controller.setPriceValue(values); // Update the values when slider changes
                                    print('Updated range values: ${values.start.round()} - ${values.end.round()}');
                                  },
                                )),
                              ),
                              Text(
                                "State",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              CustomDropdownButtonFormField<String>(
                                value: authControl.homeData!.nearbyState!.isNotEmpty
                                    ? authControl.homeData!.nearbyState!
                                    .firstWhere(
                                      (religion) => religion.sId == controller.stateId,
                                  orElse: () => authControl.homeData!.nearbyState!.first,
                                )
                                    .name
                                    : null, // Handle empty list scenario
                                items: authControl.homeData!.nearbyState!
                                    .map((position) => position.name!)
                                    .toList(),
                                hintText: "Select State",
                                onChanged: (String? value) {
                                  if (value != null) {
                                    var selected = authControl.homeData!.nearbyState!.firstWhere(
                                          (position) => position.name == value,
                                      orElse: () => authControl.homeData!.nearbyState!.first,
                                    );
                                    controller.setStateId(selected.sId!);
                                    print(controller.stateId);
                                  }
                                },
                              ),
                              sizedBox20(),
                              Text(
                                "Near By Location",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              CustomDropdownButtonFormField<String>(
                                value: authControl.homeData!.nearbyLocations!.isNotEmpty
                                    ? authControl.homeData!.nearbyLocations!
                                    .firstWhere(
                                      (religion) => religion.sId == controller.nearByLocationId,
                                  orElse: () => authControl.homeData!.nearbyLocations!.first,
                                )
                                    .name
                                    : null, // Handle empty list scenario
                                items: authControl.homeData!.nearbyLocations!
                                    .map((position) => position.name!)
                                    .toList(),
                                hintText: "Select Location",
                                onChanged: (String? value) {
                                  if (value != null) {
                                    var selected = authControl.homeData!.nearbyLocations!.firstWhere(
                                          (position) => position.name == value,
                                      orElse: () => authControl.homeData!.nearbyLocations!.first,
                                    );
                                    controller.setNearByLocationId(selected.sId!);
                                    print(controller.nearByLocationId);
                                  }
                                },
                              ),
                              sizedBox20(),
                              Text(
                                "Properties Amenities",
                                style: senRegular.copyWith(
                                    fontSize: Dimensions.fontSize15),
                              ),
                              sizedBox10(),
                              CustomDropdownButtonFormField<String>(
                                value: authControl.homeData!.propertyAmenities!.isNotEmpty
                                    ? authControl.homeData!.propertyAmenities!
                                    .firstWhere(
                                      (religion) => religion.sId == authControl.amenityId,
                                  orElse: () => authControl.homeData!.propertyAmenities!.first,
                                )
                                    .name
                                    : null, // Handle empty list scenario
                                items: authControl.homeData!.propertyAmenities!
                                    .map((position) => position.name!)
                                    .toList(),
                                hintText: "Select Properties Amenities",
                                onChanged: (String? value) {
                                  if (value != null) {
                                    var selected = authControl.homeData!.propertyAmenities!.firstWhere(
                                          (position) => position.name == value,
                                      orElse: () => authControl.homeData!.propertyAmenities!.first,
                                    );
                                    authControl.setAmenityId(selected.sId!);
                                    print(authControl.amenityId);
                                  }
                                },
                              ),
                              sizedBox20(),
                              // Text(
                              //   "Property Category",
                              //   style: senRegular.copyWith(
                              //       fontSize: Dimensions.fontSize15),
                              // ),
                              // sizedBox10(),
                              // CustomDropdownButtonFormField<String>(
                              //   value: authControl.homeData!.propertyCategory!.isNotEmpty
                              //       ? authControl.homeData!.propertyCategory!
                              //       .firstWhere(
                              //         (religion) => religion.sId == controller.propertyCategoryId,
                              //     orElse: () => authControl.homeData!.propertyCategory!.first,
                              //   )
                              //       .name
                              //       : null, // Handle empty list scenario
                              //   items: authControl.homeData!.propertyCategory!
                              //       .map((position) => position.name!)
                              //       .toList(),
                              //   hintText: "Select Properties Amenities",
                              //   onChanged: (String? value) {
                              //     if (value != null) {
                              //       var selected = authControl.homeData!.propertyCategory!.firstWhere(
                              //             (position) => position.name == value,
                              //         orElse: () => authControl.homeData!.propertyCategory!.first,
                              //       );
                              //       controller.setPropertyCategoryId(selected.sId!);
                              //       print(controller.propertyCategoryId);
                              //     }
                              //   },
                              // ),
                              Obx(() => FilterScreenField(
                                tap: () {
                                  Get.dialog(
                                    Obx(() => CustomDialogCheckBox(
                                      itemList: authControl.homeData!.propertyCategory!
                                          .map((community) => community.name!)
                                          .toList(),
                                      selectedItems: controller.propertyCategoryName.toList(),
                                      onItemSelected: (String selectedItem) {
                                        final category = authControl.homeData!.propertyCategory!
                                            .firstWhere((community) => community.name == selectedItem);
                                        final categoryId = category.sId!;

                                        if (controller.propertyCategoryName.contains(selectedItem)) {
                                          controller.setPropertyCategoryIds(categoryId);
                                          controller.setPropertyCategoryName(selectedItem);

                                        } else {
                                          controller.setPropertyCategoryIds(categoryId);
                                          controller.setPropertyCategoryName(selectedItem);
                                        }
                                        print('Selected IDs: ${controller.propertyCategoryIds.join(', ')}');
                                        print('Selected Names: ${controller.propertyCategoryName}');
                                      },
                                      dialogTitle: 'Select Property Category',
                                    )),
                                  );
                                },
                                title: 'Amenity',
                                data:controller.propertyCategoryName.isEmpty? 'Select Category' :  controller.propertyCategoryName.join(', '), // Show selected names
                              )),




                              /* sizedBox20(),
                                      Text(
                                        'Budget',
                                        style: senRegular.copyWith(
                                          fontSize: Dimensions.fontSize15,
                                        ),
                                      ),
                                      sizedBox10(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                CustomDropdownWidget(
                                                  title: "Min",
                                                  style: senRegular.copyWith(
                                                      fontSize:
                                                          Dimensions.fontSize15,
                                                      color: Theme.of(context)
                                                          .disabledColor
                                                          .withOpacity(0.40)),
                                                  itemList:
                                                      controller.budgetTypeList,
                                                  selectedValue:
                                                      controller.budgetTypeMin,
                                                  onChanged: (int? value) {
                                                    if (value != null) {
                                                      controller
                                                          .selectBudgetTypeMin(
                                                              value);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          sizedBoxW10(),
                                          Expanded(
                                            child: CustomDropdownWidget(
                                              title: "Max",
                                              style: senRegular.copyWith(
                                                  fontSize:
                                                      Dimensions.fontSize15,
                                                  color: Theme.of(context)
                                                      .disabledColor
                                                      .withOpacity(0.40)),
                                              itemList:
                                                  controller.budgetTypeList,
                                              selectedValue:
                                                  controller.budgetTypeMax,
                                              onChanged: (int? value) {
                                                if (value != null) {
                                                  controller
                                                      .selectBudgetTypeMax(
                                                          value);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      sizedBox20(),
                                      Text(
                                        'Square Feet (Area Measure)',
                                        style: senRegular.copyWith(
                                          fontSize: Dimensions.fontSize15,
                                        ),
                                      ),
                                      sizedBox10(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                CustomDropdownWidget(
                                                  title: "Min",
                                                  style: senRegular.copyWith(
                                                      fontSize:
                                                          Dimensions.fontSize15,
                                                      color: Theme.of(context)
                                                          .disabledColor
                                                          .withOpacity(0.40)),
                                                  itemList:
                                                      controller.budgetTypeList,
                                                  selectedValue:
                                                      controller.sqftMin,
                                                  onChanged: (int? value) {
                                                    if (value != null) {
                                                      controller
                                                          .selectsqFtMin(value);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          sizedBoxW10(),
                                          Expanded(
                                            child: CustomDropdownWidget(
                                              title: "Max",
                                              style: senRegular.copyWith(
                                                  fontSize:
                                                      Dimensions.fontSize15,
                                                  color: Theme.of(context)
                                                      .disabledColor
                                                      .withOpacity(0.40)),
                                              itemList:
                                                  controller.budgetTypeList,
                                              selectedValue:
                                                  controller.sqFitMax,
                                              onChanged: (int? value) {
                                                if (value != null) {
                                                  controller
                                                      .selectsqFtMax(value);
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),*/
                              sizedBox20(),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                        onPressed: () {
                                          Get.find<PropertyController>().getPropertyList(page: '1',

                                          );
                                          Get.back();
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Clear All",
                                              style: senRegular.copyWith(
                                                  color: Theme.of(
                                                      context)
                                                      .primaryColor),
                                            ),
                                            Icon(
                                              Icons.clear,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            )
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    child: CustomButtonWidget(
                                      buttonText: "Apply",
                                      onPressed: () {
                                        Get.find<PropertyController>().getPropertyList(page: '1',
                                          stateId: controller.stateId,
                                          cityId: controller.nearByLocationId,
                                          purposeId: authControl.propertyPurposeID,
                                          typeId: authControl.propertyTypeID,
                                          minPrice: controller.startPriceValue.toString(),
                                          maxPrice: controller.endPriceValue.toString(),
                                          space: controller.spaceTypeID,
                                          bathroom: controller.bathroomID,
                                          categoryId:  '${controller.propertyCategoryIds.join(', ')}',
                                          amenityId: authControl.amenityId,
                                        );
                                        Get.back();
                                      },
                                    ),
                                  )
                                ],
                              ),

                            ],
                          )),
                    );
                  });
                }),
              ),
            ],
          );
        } ),



    );
  }
}



class CustomDialogCheckBox extends StatelessWidget {
  final List<String> itemList;
  final List<String> selectedItems;
  final ValueChanged<String> onItemSelected;
  final String dialogTitle;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomDialogCheckBox({
    super.key,
    required this.itemList,
    required this.selectedItems,
    required this.onItemSelected,
    required this.dialogTitle,
    this.selectedColor = const Color(0xff4B164C),
    this.unselectedColor = const Color(0xff4B164C),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              dialogTitle,
              style: TextStyle(fontSize: 18, color: selectedColor),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                final isSelected = selectedItems.contains(item);
                return CheckboxListTile(
                  title: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected
                          ? selectedColor
                          : unselectedColor.withOpacity(0.80),
                    ),
                  ),
                  value: isSelected,
                  onChanged: (bool? selected) {
                    onItemSelected(item);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

