import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/explore_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_dropdown_button.dart';
import 'package:get_my_properties/features/widgets/group_radio_buttons.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.size.height * 0.80,
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSize10),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "1004 Results",
                    style:
                    senBold.copyWith(fontSize: Dimensions.fontSize18),
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
            child: SingleChildScrollView(
              child: GetBuilder<ExploreController>(builder: (controller) {
                return Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Property For",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        Wrap(
                          spacing: 8.0, // Space between chips
                          runSpacing: 8.0, // Space between lines of chips
                          children: List.generate(
                            controller.propertyFor.length,
                            // Assuming you have 2 buttons
                            (index) {
                              return CustomSelectedButton(
                                tap: () {
                                  controller.selectButton(index);
                                },
                                title: controller.propertyFor[index],
                                isSelected: controller.selectedButton == index,
                              );
                            },
                          ),
                        ),
                        sizedBox20(),
                        Text(
                          "Property Type",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        Wrap(
                          spacing: 8.0, // Space between chips
                          runSpacing: 8.0, // Space between lines of chips
                          children: List.generate(
                            controller.propertyType.length,
                            // Assuming you have 2 buttons
                            (index) {
                              return CustomSelectedButton(
                                tap: () {
                                  controller.selectPropertyType(index);
                                },
                                title: controller.propertyType[index],
                                isSelected: controller.propertyTypeIndex == index,
                              );
                            },
                          ),
                        ),
                        sizedBox20(),
                        Text(
                          "Space",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        Wrap(
                          spacing: 8.0, // Space between chips
                          runSpacing: 8.0, // Space between lines of chips
                          children: List.generate(
                            controller.spaceType.length,
                            // Assuming you have 2 buttons
                            (index) {
                              return CustomSelectedButton(
                                tap: () {
                                  controller.selectSpaceType(index);
                                },
                                title: controller.spaceType[index],
                                isSelected: controller.spaceTypeIndex == index,
                              );
                            },
                          ),
                        ),
                        sizedBox20(),
                        Text('Budget',style: senRegular.copyWith(fontSize: Dimensions.fontSize15,),),
                        sizedBox10(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomDropdownWidget(
                                    title: "Min",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                                    itemList: controller.budgetTypeList,
                                    selectedValue: controller.budgetTypeMin,
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        controller.selectBudgetTypeMin(value);
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
                                style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                                itemList: controller.budgetTypeList,
                                selectedValue: controller.budgetTypeMax,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectBudgetTypeMax(value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBox20(),
                        Text('Square Feet (Area Measure)',style: senRegular.copyWith(fontSize: Dimensions.fontSize15,),),
                        sizedBox10(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  CustomDropdownWidget(
                                    title: "Min",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                                    itemList: controller.budgetTypeList,
                                    selectedValue: controller.sqftMin,
                                    onChanged: (int? value) {
                                      if (value != null) {
                                        controller.selectsqFtMin(value);
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
                                style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                                itemList: controller.budgetTypeList,
                                selectedValue: controller.sqFitMax,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    controller.selectsqFtMax(value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBox20(),
                        Text(
                          "BathRooms",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        Row(
                          children: [
                            TextButton(onPressed: () {  },
                            child: Text("Any",style: senRegular.copyWith(color: Theme.of(context).primaryColor),)),
                            Wrap(
                              spacing: 8.0, // Space between chips
                              runSpacing: 8.0, // Space between lines of chips
                              children: List.generate(
                                controller.bathroomTypeList.length,
                                // Assuming you have 2 buttons
                                    (index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.selectBathRoomTypeIndex(index);
                                    },
                                    child: Container(
                                      height: 40,width: 40,
                                      decoration:  BoxDecoration(
                                        color:
                                        Theme.of(context).primaryColor.withOpacity(0.10),
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 0.5,color: controller.bathroomTypeIndex == index ?
                                        Theme.of(context).primaryColor:     Theme.of(context).primaryColor.withOpacity(0.10), )
                                      ),
                                      child: Center(
                                        child: Text( controller.bathroomTypeList[index],
                                        style: senRegular.copyWith(color: controller.bathroomTypeIndex == index ?
                                        Theme.of(context).primaryColor : Theme.of(context).disabledColor.withOpacity(0.40))),
                                      )
            
                                    ),
                                  );
                                  // return CustomSelectedButton(
                                  //   tap: () {
                                  //     controller.selectPropertyType(index);
                                  //   },
                                  //   title: controller.bathroomTypeList[index],
                                  //   isSelected: controller.propertyTypeIndex == index,
                                  // );
                                },
                              ),
                            ),
                          ],
                        ),
                        sizedBox20(),
                        Text(
                          "Other Options",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                     CustomRadioGroupWidget(
                     itemList: ['Fully Furnished', 'Garage', 'Basement','Pool','First Owner'],
                     selectedValue: controller.otherOptionIndex,
                     onChanged: (value) {
                     controller.SelectOptionIndex(value!);
                     },
                     ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text("Clear All",style: senRegular.copyWith(color:Theme.of(context).primaryColor ),),
                                      Icon(Icons.clear,color: Theme.of(context).primaryColor,)
                                    ],
                                  )),
                            ),
                            Expanded(
                              child: CustomButtonWidget(buttonText: "Apply",
                              onPressed: () {},),
                            )
                          ],
                        )
            
            
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
