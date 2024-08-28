import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/location_controller.dart';
import 'package:get_my_properties/controller/map_controller.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PropertiesMapScreen extends StatelessWidget {
  const PropertiesMapScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: Get.find<AuthController>().handleOnWillPop,
      child: Scaffold(
        appBar: const CustomAppBar(title: "Pick Location To Continue", isBackButtonExist: true),
        body: GetBuilder<MapController>(
          builder: (locationControl) {
            if (locationControl.latitude == null || locationControl.longitude == null) {
              return const Center(child: CircularProgressIndicator());
            }
            LatLng center = LatLng(locationControl.latitude!, locationControl.longitude!);
            return Stack(
              children: [
                GoogleMap(
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
                      print(placeId);
                      if (locationControl.selectedLatitude != null && locationControl.selectedLongitude != null) {
                        locationControl.mapController?.animateCamera(
                          CameraUpdate.newLatLng(
                            LatLng(locationControl.selectedLatitude!, locationControl.selectedLongitude!),
                          ),
                        );
                      }
                    },
                  ),


                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white,
                        child: Text(
                          locationControl.address ?? 'Fetching address...',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedBoxDefault(),
                      CustomButtonWidget(
                        buttonText: 'Continue',
                        onPressed: () {
                          print('==========> Address ${locationControl.address}');
                          print('==========> latitude ${locationControl.latitude}');
                          print('==========> longitude  ${locationControl.longitude}');
                          Get.find<AuthController>().saveLatitude(locationControl.latitude ?? 0.0);
                          Get.find<AuthController>().saveLongitude(locationControl.longitude ?? 0.0);
                          Get.find<AuthController>().saveAddress(locationControl.address!);
                          Get.offNamed(RouteHelper.getDashboardRoute());
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}