import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UserCurrentLocation extends StatefulWidget {
  const UserCurrentLocation({super.key});

  @override
  _UserCurrentLocationState createState() => _UserCurrentLocationState();
}
class _UserCurrentLocationState extends State<UserCurrentLocation> {
  GoogleMapController? mapController;
  LatLng? _center;
  Position? _currentPosition;
  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _center = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Location Map'),
        leading: InkWell(
          onTap: () {print(_currentPosition!.latitude);},
            child: const Icon(Icons.add_a_photo_outlined)),
      ),
      body: _center == null
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
        height: double.infinity,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center!,
            zoom: 15.0,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('user_location'),
              position: _center!,
              infoWindow: const InfoWindow(title: 'Your Location'),
            ),
          },
        ),
      ),
    );
  }
}