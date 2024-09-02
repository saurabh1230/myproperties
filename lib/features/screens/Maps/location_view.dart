import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/user_map_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LocationPickerScreen extends StatelessWidget {
  final bool isAddress;

  LocationPickerScreen({super.key, this.isAddress = false});


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Get.find<AuthController>().willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Add Location',style: senRegular,),
          centerTitle: true,
        ),
        // appBar: const CustomAppBar(title: 'Add Location',),
        body: GetBuilder<AuthController>(builder: (authControl) {
          return GetBuilder<UserMapController>(
            builder: (locationControl) {
              // Check if the location values are null and handle accordingly
              if (locationControl.latitude == null || locationControl.longitude == null) {
                return const Center(child: CircularProgressIndicator());
              }

              // Ensure latitude and longitude are non-null
              LatLng center = LatLng(
                locationControl.latitude ?? 0.0,
                locationControl.longitude ?? 0.0,
              );

              return Stack(
                children: [
                  GoogleMap(
                    mapToolbarEnabled: false,
                    onMapCreated: locationControl.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: center,
                      zoom: 14.0,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('currentLocation'),
                        position: center,
                      ),
                    },
                    onCameraMove: (CameraPosition position) {
                      locationControl.latitude = position.target.latitude;
                      locationControl.longitude = position.target.longitude;
                      locationControl.updateAddress(); // Update address on camera move
                      locationControl.update();  // Notify listeners to update UI
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
                        if (locationControl.latitude != null &&
                            locationControl.longitude != null) {
                          locationControl.mapController?.animateCamera(
                            CameraUpdate.newLatLng(
                              LatLng(locationControl.latitude!, locationControl.longitude!),
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
                            // Safeguard against null values
                            if (locationControl.address != null) {
                              print('==========> Address ${locationControl.address}');
                              print('==========> Latitude ${locationControl.latitude}');
                              print('==========> Longitude ${locationControl.longitude}');
                              authControl.saveLatitude(locationControl.latitude ?? 0.0);
                              authControl.saveLongitude(locationControl.longitude ?? 0.0);
                              authControl.saveAddress(locationControl.address!);
                              if (isAddress) {
                                Get.back();
                              } else {
                                Get.offNamed(RouteHelper.getDashboardRoute());
                              }
                            } else {
                              // Handle the case where address is null
                              print('Address is null');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
