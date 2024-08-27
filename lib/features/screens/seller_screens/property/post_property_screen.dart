
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/explore_controller.dart';
import 'package:get_my_properties/controller/location_controller.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/data/models/response/home_data_model.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/custom_dropdown_button.dart';
import 'package:get_my_properties/features/widgets/custom_textfield.dart';
import 'package:get_my_properties/features/widgets/multiple_data_field.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
import '../../../../utils/images.dart';
import '../../../../utils/sizeboxes.dart';


class PostPropertyScreen extends StatelessWidget {
   PostPropertyScreen({super.key});
   final TextEditingController _titleController = TextEditingController();
   final TextEditingController _descController = TextEditingController();
   final TextEditingController _metaTitleController = TextEditingController();
   final TextEditingController _metaDescController = TextEditingController();
   final TextEditingController _addressController = TextEditingController();
   final TextEditingController _slugController = TextEditingController();
   final TextEditingController _videoLinkController = TextEditingController();
   final TextEditingController _priceController = TextEditingController();
   final TextEditingController _marketPriceController = TextEditingController();
   final TextEditingController _areaController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().getHomeDataApi();
      Get.find<LocationController>().getCountryList();
      Get.find<LocationController>().getStateList();
      Get.find<LocationController>().getCityList('66b356ec18a20385edf487a7');
      Get.find<LocationController>().getLocalityList();
    });
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(title: "Post Property"),
      body: GetBuilder<AuthController>(builder: (authControl) {
        final data = authControl.homeData;
        final list = data == null  || authControl.homeData!.propertyTypes == null ||
            authControl.homeData!.propertyTypes!.isEmpty;
        return list ?
        const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
          child: GetBuilder<PropertyController>(builder: (propertyController) {
            return  GetBuilder<ExploreController>(builder: (controller) {
              return   GetBuilder<LocationController>(builder: (locationControl) {
                final data = locationControl.stateList;
                final list = data == null  || authControl.homeData!.propertyTypes == null ||
                    authControl.homeData!.propertyTypes!.isEmpty;
                return list ?
                const Center(child: CircularProgressIndicator()) :
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,horizontal: Dimensions.paddingSizeDefault),
                  child: Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Property Details",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        sizedBoxDefault(),
                        CustomTextField(
                          maxLines: 3,
                          controller: _titleController,
                          showTitle: true,
                          hintText: "Title ",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Property Title';
                            }
                            final RegExp nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
                            if (!nameRegExp.hasMatch(value)) {
                              return 'Please enter a valid title without special characters';
                            }
                            return null;
                          },
                        ),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _descController,
                          maxLines: 5,
                          showTitle: true,
                          hintText: "Description ",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Property Description';
                            }
                            return null;
                          },
                        ),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _addressController,
                          maxLines: 5,
                          showTitle: true,
                          hintText: "Address ",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Property Address';
                            }
                            return null;
                          },
                        ),
                        sizedBoxDefault(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _priceController,
                                inputType: TextInputType.number,
                                showTitle: true,
                                hintText: "Price in ₹",
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Property Price';
                                  }
                                  return null;
                                },
                                ),
                            ),
                            sizedBoxW10(),
                            Expanded(
                              child: CustomTextField(
                                controller: _marketPriceController,
                                inputType: TextInputType.number,
                                showTitle: true,
                                hintText: "Market Price in ₹ ",
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Property Market Price';
                                  }
                                  return null;
                                },
                                ),
                            ),
                          ],
                        ),
                        sizedBoxDefault(),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: _areaController,
                                inputType: TextInputType.number,
                                showTitle: true,
                                hintText: "Area In Square Feet",
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Add Square Feet';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            sizedBoxW10(),
                            Expanded(
                              child: CustomTextField(
                                onTap: () {
                                  Get.dialog(controller.yearPicker("Pick Build Year of Property",isBuildYear: true));
                                },
                                controller: controller.buildYearController,
                                inputType: TextInputType.number,
                                showTitle: true,
                                hintText: "Build Year",
                                readOnly: true,
                                validation: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Add Build Year';
                                  }
                                  return null;
                                },


                              ),
                            ),
                          ],
                        ),
                        sizedBoxDefault(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Rooms",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.roomDigit.isNotEmpty ? controller.roomDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Add Rooms",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectRoomDigit(value);
                                        print(controller.roomDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Rooms ';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxW10(),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bedroom",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.bedroomDigit.isNotEmpty ? controller.bedroomDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Add Bedroom",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectBedroomDigit(value);
                                        print(controller.bedroomDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Bedroom';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        sizedBoxDefault(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bathroom",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.bathroomDigit.isNotEmpty ? controller.bathroomDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Select Bathroom",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectBathroomDigit(value);
                                        print(controller.bathroomDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Bathroom';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxW10(),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kitchen",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.kitchenDigit.isNotEmpty ? controller.kitchenDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Add Kitchen",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectKitchenDigit(value);
                                        print(controller.kitchenDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Kitchen';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        sizedBoxDefault(),
                        Row(
                          children: [
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Floors",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.floorDigit.isNotEmpty ? controller.floorDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Add Floors",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectFloorDigit(value);
                                        print(controller.floorDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Floors';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            sizedBoxW10(),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Space in Bhk",
                                    style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                                  ),
                                  sizedBox10(),
                                  CustomDropdownButtonFormField<String>(
                                    value: controller.spaceDigit.isNotEmpty ? controller.spaceDigit : null,
                                    items: controller.roomList, // Pass the list of strings directly
                                    hintText: "Add Space",
                                    onChanged: (value) {
                                      if (value != null) {
                                        controller.selectSpaceDigit(value);
                                        print(controller.spaceDigit);
                                      }
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Add Space';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Unit",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: controller.unitDigit.isNotEmpty ? controller.unitDigit : null,
                          items: controller.roomList, // Pass the list of strings directly
                          hintText: "Add Unit",
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectUnitDigit(value);
                              print(controller.unitDigit);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Add Unit';
                            }
                            return null;
                          },
                        ),
                        // sizedBoxDefault(),
                        // CustomTextField(
                        //   onTap: () {
                        //     Get.dialog(controller.yearPicker("Pick Build Year of Property"));
                        //   },
                        //   controller: controller.expireYearController,
                        //   inputType: TextInputType.number,
                        //   showTitle: true,
                        //   hintText: "Expiry Year",
                        //   readOnly: true,
                        //   validation: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Add Expiry Year';
                        //     }
                        //     return null;
                        //   },
                        //
                        //
                        // ),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _metaTitleController,
                          maxLines: 1,
                          showTitle: true,
                          hintText: "Meta Title ",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Add Meta Title';
                            }
                            return null;
                          },
                        ),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _metaDescController,
                          maxLines: 2,
                          showTitle: true,
                          hintText: "Meta Description ",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Add Meta Description';
                            }
                            return null;
                          },),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _slugController,
                          maxLines: 1,
                          showTitle: true,
                          hintText: "Slug",
                          capitalization: TextCapitalization.words,
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Add Slug';
                            }
                            return null;
                          },),
                        sizedBoxDefault(),
                        CustomTextField(
                          controller: _videoLinkController,
                          maxLines: 1,
                          showTitle: true,
                          hintText: "Video Link",
                         ),
                        sizedBoxDefault(),
                        Text(
                          "Property Type",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: authControl.homeData!.propertyTypes!.isNotEmpty
                              ? authControl.homeData!.propertyTypes!
                              .firstWhere(
                                (religion) => religion.sId == authControl.propertyTypeID,
                            orElse: () => authControl.homeData!.propertyTypes!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: authControl.homeData!.propertyTypes!
                              .map((position) => position.name!)
                              .toList(),
                          hintText: "Select Location",
                          onChanged: (String? value) {
                            if (value != null) {
                              var val = authControl.homeData!.propertyTypes!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => authControl.homeData!.propertyTypes!.first,
                              );
                              authControl.selectPropertyTypeId(val.sId.toString());
                              print(authControl.propertyTypeID);
                            }
                          },
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Property Purpose",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: authControl.homeData!.propertyPurposes!.isNotEmpty
                              ? authControl.homeData!.propertyPurposes!
                              .firstWhere(
                                (religion) => religion.sId == authControl.propertyPurposeID,
                            orElse: () => authControl.homeData!.propertyPurposes!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: authControl.homeData!.propertyPurposes!
                              .map((position) => position.name!)
                              .toList(),
                          hintText: "Select Location",
                          onChanged: (String? value) {
                            if (value != null) {
                              var val = authControl.homeData!.propertyPurposes!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => authControl.homeData!.propertyPurposes!.first,
                              );
                              authControl.selectPropertyPurposeId(val.sId.toString());
                              print(authControl.propertyPurposeID);
                            }
                          },
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Property Category",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: authControl.homeData!.propertyCategory!.isNotEmpty
                              ? authControl.homeData!.propertyCategory!
                              .firstWhere(
                                (religion) => religion.sId == authControl.propertyCategoryId,
                            orElse: () => authControl.homeData!.propertyCategory!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: authControl.homeData!.propertyCategory!
                              .map((position) => position.name!)
                              .toList(),
                          hintText: "Select Location",
                          onChanged: (String? value) {
                            if (value != null) {
                              var val = authControl.homeData!.propertyCategory!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => authControl.homeData!.propertyCategory!.first,
                              );
                              authControl.selectPropertyCategoryId(val.sId.toString());
                              print(authControl.propertyCategoryId);
                            }
                          },
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Property Amenity",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),

                        Wrap(
                          spacing: 8.0, // Space between chips
                          runSpacing: 8.0, // Space between lines of chips
                          children: List.generate(
                            authControl.homeData!.propertyAmenities!.length,
                                (index) {
                              final val = authControl.homeData!.propertyAmenities![index];
                              final isSelected = authControl.amenityIds.contains(val.sId.toString());
                              return CustomSelectedButton(
                                tap: () {
                                  authControl.setAmenityIds(val.sId.toString());
                                  print(authControl.amenityIds.join(','));
                                },
                                title: val.name.toString(),
                                isSelected: isSelected,
                              );
                            },
                          ),
                        ),

                        // CustomDropdownButtonFormField<String>(
                        //   value: authControl.amenityId, // ID of the selected amenity
                        //   items: authControl.homeData!.propertyAmenities!.map((amenity) {
                        //     return amenity.name!;
                        //   }).toList(),
                        //   hintText: "Select Amenity",
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please select an amenity'; // Validation message
                        //     }
                        //     return null;
                        //   },
                        //   onChanged: (String? value) {
                        //     if (value != null) {
                        //       var selectedAmenity = authControl.homeData!.propertyAmenities!.firstWhere(
                        //             (amenity) => amenity.name == value,
                        //         orElse: () => authControl.homeData!.propertyAmenities!.first,
                        //       );
                        //       authControl.setAmenityId(selectedAmenity.sId!);
                        //       print(authControl.amenityId);
                        //     }
                        //   },
                        // ),



                        sizedBoxDefault(),
                        Text(
                          "Property State",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: locationControl.stateList!.isNotEmpty
                              ?  locationControl.stateList!
                              .firstWhere(
                                (val) => val.id == locationControl.stateId,
                            orElse: () => locationControl.stateList!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: locationControl.stateList!
                              .map((position) => position.name)
                              .toList(),
                          hintText: "Select State",
                          onChanged: (String? value) {
                            if (value != null) {
                              var selected = locationControl.stateList!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => locationControl.stateList!.first,
                              );
                              locationControl.setStateId(
                                  selected.id
                              );
                              print(locationControl.stateId);
                            }
                          },
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Property City",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: locationControl.cityList!.isNotEmpty
                              ?  locationControl.cityList!
                              .firstWhere(
                                (val) => val.id == locationControl.cityId,
                            orElse: () => locationControl.cityList!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: locationControl.cityList!
                              .map((position) => position.name)
                              .toList(),
                          hintText: "Select State",
                          onChanged: (String? value) {
                            if (value != null) {
                              var selected = locationControl.cityList!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => locationControl.cityList!.first,
                              );
                              locationControl.setCityId(selected.id);
                              print(locationControl.cityId);
                            }
                          },
                        ),
                        sizedBoxDefault(),
                        Text(
                          "Locality",
                          style: senRegular.copyWith(
                              fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: locationControl.localityList!.isNotEmpty
                              ?  locationControl.localityList!
                              .firstWhere(
                                (val) => val.id == locationControl.localityId,
                            orElse: () => locationControl.localityList!.first,
                          )
                              .name
                              : null, // Handle empty list scenario
                          items: locationControl.localityList!
                              .map((position) => position.name)
                              .toList(),
                          hintText: "Select State",
                          onChanged: (String? value) {
                            if (value != null) {
                              var selected = locationControl.localityList!.firstWhere(
                                    (position) => position.name == value,
                                orElse: () => locationControl.localityList!.first,
                              );
                              locationControl.setLocalityId(selected.id);
                              print(locationControl.localityId);
                            }
                          },
                        ),
                        sizedBoxDefault(),
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
                        sizedBoxDefault(),
                        Text(
                          "Property Direction",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        CustomDropdownButtonFormField<String>(
                          value: controller.selectedDirection.isNotEmpty ? controller.selectedDirection : null,
                          items: controller.directionList, // Pass the list of strings directly
                          hintText: "Select Direction",
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectDirection(value);
                              print(controller.selectedDirection);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Add Property Direction ';
                            }
                            return null;
                          },
                        ),


                        sizedBoxDefault(),
                        Text(
                          "Media Content",
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize15),
                        ),
                        sizedBox10(),
                        Text("Display Image *",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                        sizedBox10(),
                        InkWell(
                          onTap: () =>propertyController.pickDisplayImage(isRemove: false),
                          child: Container(
                            width: Get.size.width,
                            height: 150,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(Dimensions.radius10)
                            ),
                            // padding: EdgeInsets.all(Dimensions.paddingSize20),
                            child: propertyController.pickedDisplayImage != null ?
                            Image.file(
                              File(propertyController.pickedDisplayImage!.path), fit: BoxFit.cover,
                            ) :

                            Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(Images.placeholder,height: 50,color: Theme.of(context).disabledColor.withOpacity(0.40),),
                                sizedBox4(),
                                Text("Add Main Image of Property",style: senMedium.copyWith(
                                    fontSize: Dimensions.fontSize12,
                                    color: Theme.of(context).disabledColor.withOpacity(0.40)),)
                              ],
                            ),
                          ),
                        ),
                        sizedBox10(),
                        propertyController.pickedDisplayImage != null ? const SizedBox() :
                        Text('Add Property Display Image',style: senRegular.copyWith(color: Colors.redAccent,fontSize:Dimensions.fontSize12)),
                        sizedBox10(),
                        Text("Gallery Image *",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                        sizedBox10(),
                        Column(
                          children: [
                            InkWell(
                              onTap: () => propertyController.pickGalleryImage(),
                              child: Container(
                                width: Get.size.width,
                                height: 200,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: propertyController.pickedGalleryImages.isNotEmpty
                                    ? GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0,
                                  ),
                                  itemCount: propertyController.pickedGalleryImages.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Image.file(
                                          File(propertyController.pickedGalleryImages[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: IconButton(
                                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                                            onPressed: () {
                                              propertyController.removeImage(index);
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                                    : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo, size: 50, color: Theme.of(context).disabledColor.withOpacity(0.40)),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "Add Gallery Images Of Property",

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),


                        sizedBox10(),
                        propertyController.pickedGalleryImages.isNotEmpty ? const SizedBox() :
                        Text('Add Property Gallery Images',style: senRegular.copyWith(color: Colors.redAccent,fontSize:Dimensions.fontSize12)),
                        sizedBoxDefault(),

                        propertyController.isLoading ?
                        const Center(child: CircularProgressIndicator()) :
                        CustomButtonWidget(
                          buttonText: '+ Add Property',
                          onPressed: () {
                            print('PropertyId: ${authControl.propertyTypeID}');
                            print('PurposeId: ${authControl.propertyPurposeID}');
                            print('CategoryId: ${authControl.propertyCategoryId}');
                            print('AmenityId: ${authControl.amenityId}');
                            print('Slug: for-sale-in-the-world-towers-lower-parel');
                            print('Title: ${_titleController.text}');
                            print('Description: ${_descController.text}');
                            print('MetaTitle: ${_metaTitleController.text}');
                            print('MetaDesc: ${_metaDescController.text}');
                            print('Address: ${_addressController.text}');
                            print('Unit: ${controller.unitDigit}');
                            print('VideoLink: ${_videoLinkController.text}');
                            print('Room: ${controller.roomDigit}');
                            print('Space: ${controller.spaceDigit}');
                            print('Bedroom: ${controller.bedroomDigit}');
                            print('Bathroom: ${controller.bathroomDigit}');
                            print('Floor: ${controller.floorDigit}');
                            print('Kitchen: ${controller.kitchenDigit}');
                            print('BuildYear: ${controller.buildYearController.text}');
                            print('Area: ${_areaController.text}');
                            print('Direction: ${controller.selectedDirection}');
                            print('Price: ${_priceController.text}');
                            print('MarketPrice: ${_marketPriceController.text}');
                            print('IsFeatured: true');
                            print('TopProperty: false');
                            print('ExpiryDate: ${controller.expireYearController.text}');
                            print('StateId: ${locationControl.stateId}');
                            print('CityId: ${locationControl.cityId}');
                            print('LocalityId: ${locationControl.localityId}');
                            print('Latitude: 18.5204');
                            print('Longitude: 73.8567');
                            print('DisplayImage: ${propertyController.pickedDisplayImage}');
                            print('GalleryImages: ${propertyController.pickedGalleryImages}');

                            if(_formKey.currentState!.validate()) {
                              if( propertyController.pickedGalleryImages.isNotEmpty && propertyController.pickedDisplayImage != null ) {
                                return propertyController.postPropertyApi(
                                  typeId: authControl.propertyTypeID,
                                  purposeId: authControl.propertyPurposeID,
                                  categoryId: authControl.propertyCategoryId,
                                  amenityId: authControl.amenityId!,
                                  slug: _slugController.text,
                                  title: _titleController.text,
                                  description: _descController.text,
                                  metaTitle: _metaTitleController.text,
                                  metaDesc: _metaDescController.text,
                                  address: _addressController.text,
                                  unit: controller.unitDigit,
                                  videoLink: _videoLinkController.text,
                                  room: controller.roomDigit,
                                  space: controller.spaceDigit,
                                  bedroom: controller.bedroomDigit,
                                  bathroom: controller.bathroomDigit,
                                  floor: controller.floorDigit,
                                  kitchen: controller.kitchenDigit,
                                  buildYear: controller.buildYearController.text,
                                  area: _areaController.text,
                                  direction: 'east',
                                  // direction: controller.selectedDirection,
                                  price: _priceController.text,
                                  marketPrice: _marketPriceController.text,
                                  isFeatured: 'true',
                                  topProperty: 'false',
                                  expiryDate: controller.expireYearController.text,
                                  stateId: locationControl.stateId!,
                                  cityId: locationControl.cityId!,
                                  localityId: locationControl.localityId!,
                                  latitude: '18.5204',
                                  longitude: '73.8567',
                                  displayImage: propertyController.pickedDisplayImage,
                                  galleryImages: propertyController.pickedGalleryImages,
                                );
                              }
                            }
                          },
                        ),
                        sizedBox50(),

                      ],
                    ),
                  ),
                );
              });
            });
          }),
        );
      }),
    );
  }
}

class YearPickerWidget extends StatelessWidget {
  final int startYear;
  final int endYear;
  final Function(int) onYearSelected;

  YearPickerWidget({
    required this.startYear,
    required this.endYear,
    required this.onYearSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            child: CupertinoPicker(
              itemExtent: 32,
              scrollController: FixedExtentScrollController(
                initialItem: DateTime.now().year - startYear,
              ),
              onSelectedItemChanged: (int index) {
                onYearSelected(startYear + index);
              },
              children: List<Widget>.generate(endYear - startYear + 1, (int index) {
                return Center(
                  child: Text('${startYear + index}'),
                );
              }),
            ),
          ),
          CupertinoButton(
            child: const Text('Confirm'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}





class MultiSelectDropdown<T> extends StatelessWidget {
  final List<T> items;
  final List<T> selectedItems;
  final String Function(T) itemAsString;
  final void Function(List<T>) onChanged;

  MultiSelectDropdown({
    required this.items,
    required this.selectedItems,
    required this.itemAsString,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        border: OutlineInputBorder(),
      ),
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Row(
            children: [
              Checkbox(
                value: selectedItems.contains(item),
                onChanged: (bool? selected) {
                  if (selected != null) {
                    final updatedSelection = List<T>.from(selectedItems);
                    if (selected) {
                      updatedSelection.add(item);
                    } else {
                      updatedSelection.remove(item);
                    }
                    onChanged(updatedSelection);
                  }
                },
              ),
              Text(itemAsString(item)),
            ],
          ),
        );
      }).toList(),
      onChanged: (_) {}, // Prevent the dropdown from closing on click
      value: null,
      isExpanded: true,
    );
  }
}

