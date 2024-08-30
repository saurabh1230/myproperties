import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/Maps/widgets/map_property_bottomsheet.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  double? selectedLatitude;
  double? selectedLongitude;
  String? address;

  List<LatLng> markerCoordinates = Get.find<PropertyController>().markerCoordinates;

  @override
  void onInit() {
    super.onInit();
    focusOnMarkers(); // Only focus on the initial markers
  }

  void focusOnMarkers() {
    if (mapController != null && markerCoordinates.isNotEmpty) {
      LatLngBounds bounds;
      LatLng northeast = LatLng(markerCoordinates[0].latitude, markerCoordinates[0].longitude);
      LatLng southwest = LatLng(markerCoordinates[0].latitude, markerCoordinates[0].longitude);

      for (LatLng coord in markerCoordinates) {
        if (coord.latitude > northeast.latitude) northeast = LatLng(coord.latitude, northeast.longitude);
        if (coord.longitude > northeast.longitude) northeast = LatLng(northeast.latitude, coord.longitude);
        if (coord.latitude < southwest.latitude) southwest = LatLng(coord.latitude, southwest.longitude);
        if (coord.longitude < southwest.longitude) southwest = LatLng(southwest.latitude, coord.longitude);
      }

      bounds = LatLngBounds(southwest: southwest, northeast: northeast);

      mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));

    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
    focusOnMarkers(); // Focus on markers when the map is created
  }

  // API key for Google Places API
  String apiKey = 'AIzaSyBNB2kmkXSOtldNxPdJ6vPs_yaiXBG6SSU';
  RxList<Map<String, String>> suggestions = <Map<String, String>>[].obs;

  Future<void> fetchSuggestions(String query) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('API Response: $data'); // Log API response
      if (data['status'] == 'OK') {
        final List<dynamic> predictions = data['predictions'];
        suggestions.value = predictions.map((prediction) {
          return {
            'description': prediction['description'] as String,
            'place_id': prediction['place_id'] as String,
          };
        }).toList();// Log suggestions
      } else {
        suggestions.value = [];
      }
    } else {
      suggestions.value = [];
    }
  }

  Future<void> fetchLocationDetails(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        final location = data['result']['geometry']['location'];
        selectedLatitude = location['lat'];
        selectedLongitude = location['lng'];
        print('Selected Latitude: $selectedLatitude');
        print('Selected Longitude: $selectedLongitude');
        if (selectedLatitude != null && selectedLongitude != null) {
          mapController?.animateCamera(
            CameraUpdate.newLatLng(LatLng(selectedLatitude!, selectedLongitude!)),
          );
          Get.bottomSheet(
            MapPropertySheet(
              lat: selectedLatitude.toString(),
              long: selectedLongitude.toString(),
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

        update();  // Update the UI
      }
    }
  }
}

