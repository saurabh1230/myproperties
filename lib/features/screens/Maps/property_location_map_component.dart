import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get_my_properties/controller/location_controller.dart';

class PropertyLocationMapComponent extends StatelessWidget {
  final double? longitude;
  final double? latitude;

  const PropertyLocationMapComponent({
    super.key,
    this.longitude,
    this.latitude,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: Get.size.width,
      child: GetBuilder<LocationController>(
        builder: (locationControl) {
          if (longitude == null || latitude == null || locationControl.latitude == null || locationControl.longitude == null) {
            return const Center(child: CircularProgressIndicator());
          }
          LatLng center = LatLng(latitude!, longitude!);
          return GoogleMap(
            mapToolbarEnabled: false,
            zoomGesturesEnabled: true,  // Ensure zoom gestures are enabled
            zoomControlsEnabled: true,
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
            onMapCreated: (GoogleMapController controller) {
              locationControl.onMapCreated(controller);
              controller.animateCamera(
                CameraUpdate.newLatLng(center),
              );
            },
            onCameraMove: (CameraPosition position) {
            },
          );
        },
      ),
    );
  }
}
