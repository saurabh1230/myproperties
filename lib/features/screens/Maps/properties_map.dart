

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/map_controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_my_properties/controller/property_controller.dart';
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
      appBar: CustomAppBar(
        title: "Find Properties",
        isBackButtonExist: true,
        onBackPressed: () {
          Get.back();
          Get.find<PropertyController>().getPropertyList(page: '1');
        },
      ),
      body: GetBuilder<MapController>(
        builder: (locationControl) {
          if (locationControl.markerCoordinates.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              GoogleMap(
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                onMapCreated: locationControl.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: locationControl.markerCoordinates.first,
                  zoom: 25.0,
                ),
                markers: locationControl.markerCoordinates.map((coord) {
                  return Marker(
                    markerId: MarkerId(coord.toString()),
                    position: coord,
                  );
                }).toSet(),
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
                      Get.bottomSheet(
                        MapPropertySheet(
                          lat: locationControl.selectedLatitude.toString(),
                          long: locationControl.selectedLongitude.toString(),
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius20),
                            topRight: Radius.circular(Dimensions.radius20),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              Positioned(
                bottom: Dimensions.paddingSizeDefault,
                left: Dimensions.paddingSizeDefault,
                right: Dimensions.paddingSizeDefault,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.find<PropertyController>().getPropertyList(
                          page: '1',
                          lat: locationControl.selectedLatitude.toString(),
                          long: locationControl.selectedLongitude.toString(),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSize40,
                          vertical: Dimensions.fontSize18,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Text(
                          '← Save Location',
                          style: senBold.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).cardColor,
                      onPressed: () {
                        Get.bottomSheet(
                          MapPropertySheet(
                            lat: locationControl.selectedLatitude.toString(),
                            long: locationControl.selectedLongitude.toString(),
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20),
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.apartment,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


