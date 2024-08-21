import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/location_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Get.find<AuthController>().handleOnWillPop,
      child: Scaffold(
          appBar: const CustomAppBar(title: "Pick Location To Continue", isBackButtonExist: true),
          body: GetBuilder<LocationController>(
            builder: (locationControl) {
              return GetBuilder<AuthController>(builder: (authControl) {
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
                          CustomButtonWidget(buttonText: 'Continue',
                            onPressed: () {
                              print('==========> Address ${locationControl.address}');
                              print( '==========> latitude ${locationControl.latitude}');
                              print( '==========> longitude  ${locationControl.longitude}');
                              authControl.saveLatitude(locationControl.latitude ?? 0.0);
                              authControl.saveLongitude(locationControl.longitude ?? 0.0);
                              authControl.saveAddress(locationControl.address!);
                              Get.offNamed(RouteHelper.getDashboardRoute());

                            },)
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        ),
    );
  }
}

class LocationSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const LocationSearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search location...',
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              onSearch(searchController.text);
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}