import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/properties_controller.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/seller_screens/property/widgets/add_images_widget.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_dropdown_button.dart';
import 'package:get_my_properties/features/widgets/edit_textfield.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
import '../../../../utils/images.dart';
import '../../../../utils/sizeboxes.dart';

class PostPropertyScreen extends StatelessWidget {
   PostPropertyScreen({super.key});
  final TextEditingController _tagController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Post Property"),
      body: SingleChildScrollView(
        child: GetBuilder<PropertiesController>(builder: (controller) {
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,horizontal: Dimensions.paddingSizeDefault),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Property Details",
                  style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                ),
                sizedBox10(),
                CustomDropdownWidget(
                  title: "Property Type",
                  style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                  itemList: controller.propertyTypeList,
                  selectedValue: controller.propertyType,
                  onChanged: (int? value) {
                    if (value != null) {
                      controller.selectPropertyType(value);
                    }
                  },
                ),
                sizedBoxDefault(),
                CustomTextField(
                  maxLines: 3,
                  showTitle: true,
                  titleStyle:  senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                  hintText: "Title ",
                capitalization: TextCapitalization.words,),
                sizedBoxDefault(),
                CustomTextField(
                  maxLines: 5,
                  showTitle: true,
                  titleStyle:  senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                  hintText: "Description ",
                  capitalization: TextCapitalization.words,),
                sizedBoxDefault(),
                CustomDropdownWidget(
                  title: "Category",
                  style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                  itemList: controller.categoryTypeList,
                  selectedValue: controller.categoryType,
                  onChanged: (int? value) {
                    if (value != null) {
                      controller.selectCategoryType(value);
                    }
                  },
                ),
                sizedBoxDefault(),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        inputType: TextInputType.number,
                        showTitle: true,
                        titleStyle:  senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                        hintText: "Total Area in sqFt ",
                        capitalization: TextCapitalization.words,),
                    ),
                    sizedBoxW10(),
                    Expanded(
                      child: CustomTextField(
                        inputType: TextInputType.number,
                        showTitle: true,
                        titleStyle:  senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                        hintText: "Price ₹",
                        capitalization: TextCapitalization.words,),
                    ),
                  ],
                ),
                sizedBoxDefault(),
                CustomTextField(
                  maxLines: 2,
                  showTitle: true,
                  titleStyle:  senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),
                  hintText: "Location",
                  capitalization: TextCapitalization.words,),
                sizedBoxDefault(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 8,
                          child: CustomTextField(
                            hintText: 'Tag',
                            controller: _tagController,
                            inputAction: TextInputAction.done,
                            onSubmit: (name){
                              if(name.isNotEmpty) {
                                controller.setTag(name);
                                _tagController.text = '';
                              }
                            },
                          ),
                        ),
                        sizedBoxW10(),

                        Expanded(
                          flex: 2,
                          child: CustomButtonWidget(buttonText: 'Add', onPressed: (){
                            if(_tagController.text.isNotEmpty) {
                              controller.setTag(_tagController.text.trim());
                              _tagController.text = '';
                            }
                          }),
                        )
                      ]),
                  sizedBox10(),

                  controller.tagList.isNotEmpty ? SizedBox(
                    height: 40,
                    child: ListView.builder(
                        shrinkWrap: true, scrollDirection: Axis.horizontal,
                        itemCount: controller.tagList.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize5),
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize5),
                            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(Dimensions.radius5)),
                            child: Center(child: Row(children: [
                              Text(controller.tagList[index]!, style: senMedium.copyWith(color: Theme.of(context).cardColor)),
                              const SizedBox(width: Dimensions.paddingSize5),

                              InkWell(onTap: () => controller.removeTag(index), child: Icon(Icons.clear, size: 18, color: Theme.of(context).cardColor)),
                            ])),
                          );
                        }),
                  ) : const SizedBox(),
                ]),
                sizedBoxDefault(),
                Text(
                  "Media Content",
                  style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                ),
                sizedBox10(),
                Text("Display Image *",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                sizedBox5(),
                InkWell(
                  onTap: () =>controller.pickMainImage(),
                  child: Container(
                    width: Get.size.width,
                    height: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(Dimensions.radius10)
                    ),
                    // padding: EdgeInsets.all(Dimensions.paddingSize20),
                    child: controller.pickedLogo != null ?
                    Image.file(
                      File(controller.pickedLogo!.path), fit: BoxFit.cover,
                    ) :

                    Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(Images.placeholder,height: 50),
                        sizedBox4(),
                        Text("Add Main Image Of Property",style: senMedium.copyWith(
                          fontSize: Dimensions.fontSize12,
                            color: Theme.of(context).disabledColor.withOpacity(0.40)),)
                      ],
                    ),
                  ),
                ),
                sizedBoxDefault(),
                Text("Property Video *",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                sizedBox5(),
                InkWell(
                  onTap: () => controller.pickMainVideo(),
                  child: Container(
                    width: Get.size.width,
                    height: 150,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: controller.pickedVideo != null ?
                    // Display picked video thumbnail or placeholder
                    Image.file(
                      File(controller.pickedVideo!.path),
                      width: Get.size.width,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                        :
                    // Placeholder content
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.video_collection, size: 50, color: Colors.grey),
                        SizedBox(height: 4),
                        Text(
                          "Add Main Video Of Property",
                          style: TextStyle(
                            fontSize: Dimensions.fontSize12,
                            color: Theme.of(context).disabledColor.withOpacity(0.40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                sizedBoxDefault(),
                Text("Gallery Image *",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                sizedBox5(),
                SizedBox(height: 400,
                    child: EditPhotosScreen())
              ],
            ),
          );
        } ),

      ),
    );

  }
}
