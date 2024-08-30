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
  double? latitude;
  double? longitude;
  String? address;
  double? selectedLatitude;
  double? selectedLongitude;

  List<LatLng> markerCoordinates = Get.find<PropertyController>().markerCoordinates;


  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  Future<void> getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;  // Handle if location services are not enabled
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return;  // Handle if permission is permanently denied
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
      }
    }

    // Get current position
    Position currentPosition = await Geolocator.getCurrentPosition();
    latitude = currentPosition.latitude;
    longitude = currentPosition.longitude;

    // Convert coordinates to address
    await updateAddress();

    // Focus on markers
    focusOnMarkers();

    // Notify listeners to rebuild the UI
    update();
  }

  Future<void> updateAddress() async {
    if (latitude != null && longitude != null) {
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(latitude!, longitude!);
        if (placemarks.isNotEmpty) {
          Placemark placemark = placemarks.first;
          address = '${placemark.street}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.postalCode}, ${placemark.country}';
        }
      } catch (e) {
        print("Error occurred while converting coordinates to address: $e");
      }
    }
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
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
    focusOnMarkers(); // Focus on markers when the map is created
  }



  String apiKey = 'AIzaSyBNB2kmkXSOtldNxPdJ6vPs_yaiXBG6SSU';  // Replace with your Google API Key
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
        }).toList();
        print('Suggestions: ${suggestions.value}'); // Log suggestions
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
        print('====================> selectedLatitude ${selectedLatitude}');
        print('====================> selectedLatitude ${selectedLongitude}');
        update();  // Update the UI
      }
    }
  }


}
