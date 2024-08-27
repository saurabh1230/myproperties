import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  GoogleMapController? mapController;
  double? latitude;
  double? longitude;
  String? address;

  // List of marker coordinates
  final List<LatLng> markerCoordinates = [
    LatLng(22.5431, 88.1871), // Victoria Memorial
    LatLng(22.5914, 88.3238), // Howrah Bridge
    LatLng(22.5644, 88.1241), // Indian Museum
    LatLng(22.5678, 88.3477), // New Market
    LatLng(22.5593, 88.3705), // Kolkata Zoo
    LatLng(22.5586, 88.3773), // Science City
    LatLng(22.5163, 88.3225), // Kalighat Temple
    LatLng(22.5678, 88.3576), // Nandan
    LatLng(22.6411, 88.3500), // Alambazar
    LatLng(22.5724, 88.4030), // Salt Lake Stadium
  ];

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
        return;  // Handle if permission is denied
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
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    update();
    focusOnMarkers(); // Focus on markers when the map is created
  }
}
