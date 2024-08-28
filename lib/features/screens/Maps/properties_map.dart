

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/map_controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_my_properties/features/screens/Maps/widgets/map_property_bottomsheet.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertiesMapScreen extends StatelessWidget {
  const PropertiesMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor:  Theme.of(context).cardColor,
      //   onPressed: () {
      //   Get.bottomSheet(
      //     const MapPropertySheet(),
      //     isScrollControlled: true,
      //     backgroundColor: Colors.white, // Customize the background color if needed
      //     shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(Dimensions.radius20),
      //         topRight: Radius.circular(Dimensions.radius20),
      //       ),
      //     ),
      //   );
      // },child:  Icon(Icons.apartment,color: Theme.of(context).primaryColor,),),
      appBar: const CustomAppBar(
        title: "Find Properties",
        isBackButtonExist: true,
      ),
      body: GetBuilder<MapController>(
        builder: (locationControl) {
          if (locationControl.latitude == null || locationControl.longitude == null) {
            return const Center(child: CircularProgressIndicator());
          }

          LatLng center = LatLng(locationControl.latitude!, locationControl.longitude!);

          return Stack(
            children: [
              GoogleMap(zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                onMapCreated: locationControl.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: center,
                  zoom: 14.0,
                ),
                markers: locationControl.markerCoordinates.map((coord) {
                  return Marker(
                    markerId: MarkerId(coord.toString()),
                    position: coord,
                  );
                }).toSet(),
                onCameraMove: (CameraPosition position) {
                  locationControl.latitude = position.target.latitude;
                  locationControl.longitude = position.target.longitude;
                  locationControl.updateAddress();
                  locationControl.update();
                },
              ),
              Positioned(
                top: 10,
                left: 20,
                right: 20,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      hintText: 'Search Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    await locationControl.fetchSuggestions(pattern);
                    return locationControl.suggestions.toList();
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion['description'] ?? ''),
                    );
                  },
                  onSuggestionSelected: (suggestion) async {
                    String placeId = suggestion['place_id'] ?? '';
                    await locationControl.fetchLocationDetails(placeId);
                    if (locationControl.selectedLatitude != null &&
                        locationControl.selectedLongitude != null) {
                      locationControl.mapController?.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(locationControl.selectedLatitude!, locationControl.selectedLongitude!),
                        ),
                      );
                    }
                  },
                ),
              ),
              Positioned(bottom: Dimensions.paddingSizeDefault,
                left: Dimensions.paddingSizeDefault,
                right: Dimensions.paddingSizeDefault,
                child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   InkWell(onTap: () {


                   },
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize40,
                       vertical: Dimensions.fontSize18),
                       decoration: BoxDecoration(
                         color: Theme.of(context).cardColor,
                         borderRadius: BorderRadius.circular(Dimensions.radius20)),
                       child: Text('← Save Location',style: senBold.copyWith(
                         fontSize: Dimensions.fontSizeDefault,
                         color: Theme.of(context).primaryColor
                       ),),
                     ),
                   ),
                    FloatingActionButton(
                      backgroundColor:  Theme.of(context).cardColor,
                      onPressed: () {
                        Get.bottomSheet(
                          const MapPropertySheet(),
                          isScrollControlled: true,
                          backgroundColor: Colors.white, // Customize the background color if needed
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20),
                            ),
                          ),
                        );
                      },child:  Icon(Icons.apartment,color: Theme.of(context).primaryColor,),),
                  ],
                ),
              ),
              // Positioned(
              //   bottom: Dimensions.paddingSizeDefault,
              //   left: 0,right: 0,
              //   child: CustomButtonWidget(
              //     buttonText: 'Continue',
              //     onPressed: () {
              //       // if (locationControl.latitude != null && locationControl.longitude != null) {
              //       //   // Show BottomSheet
              //       //   showModalBottomSheet(
              //       //     shape: const RoundedRectangleBorder(
              //       //       borderRadius: BorderRadius.only(
              //       //         topLeft: Radius.circular(Dimensions.radius20),
              //       //         topRight: Radius.circular(Dimensions.radius20),
              //       //       ),
              //       //     ),
              //       //     context: context,
              //       //     builder: (context) {
              //       //       return MapPropertySheet();
              //       //     },
              //       //   );
              //       // } else {
              //       //   // Handle the case where latitude and longitude are null (optional)
              //       //   Get.snackbar(
              //       //     'Error',
              //       //     'Please select a valid location.',
              //       //     backgroundColor: Colors.red,
              //       //     colorText: Colors.white,
              //       //   );
              //       // }
              //     },
              //   ),
              // ),
              // Positioned(
              //   bottom: 20,
              //   left: 20,
              //   right: 20,
              //   child: Column(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(16.0),
              //         color: Colors.white,
              //         child: Text(
              //           locationControl.address ?? 'Fetching address...',
              //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       // sizedBoxDefault(),
              //       // CustomButtonWidget(
              //       //   buttonText: 'Continue',
              //       //   onPressed: () {
              //       //     // if (locationControl.latitude != null && locationControl.longitude != null) {
              //       //     //   // Show BottomSheet
              //       //     //   showModalBottomSheet(
              //       //     //     shape: const RoundedRectangleBorder(
              //       //     //       borderRadius: BorderRadius.only(
              //       //     //         topLeft: Radius.circular(Dimensions.radius20),
              //       //     //         topRight: Radius.circular(Dimensions.radius20),
              //       //     //       ),
              //       //     //     ),
              //       //     //     context: context,
              //       //     //     builder: (context) {
              //       //     //       return MapPropertySheet();
              //       //     //     },
              //       //     //   );
              //       //     // } else {
              //       //     //   // Handle the case where latitude and longitude are null (optional)
              //       //     //   Get.snackbar(
              //       //     //     'Error',
              //       //     //     'Please select a valid location.',
              //       //     //     backgroundColor: Colors.red,
              //       //     //     colorText: Colors.white,
              //       //     //   );
              //       //     // }
              //       //   },
              //       // ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}

