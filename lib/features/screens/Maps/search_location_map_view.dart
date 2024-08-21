import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/controller/location_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Get.find<AuthController>().handleOnWillPop,
      child: Scaffold(
        appBar: const CustomAppBar(title: "Pick Location To Continue", isBackButtonExist: true),
        body: GetBuilder<LocationController>(
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
                  markers: {
                    Marker(
                      markerId: const MarkerId('currentLocation'),
                      position: center,
                    ),
                  },
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  right: 10,
                  child: LocationSearchBar(
                    onSearch: (query) {
                      // locationControl.searchLocation(query);
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
                          locationControl.address ?? 'Search for a location...',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      sizedBoxDefault(),
                      CustomButtonWidget(
                        buttonText: 'Continue',
                        onPressed: () {

                        },
                      ),
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
          fillColor: Theme.of(context).cardColor,
          filled: true,
          hintText: 'Search location...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
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
