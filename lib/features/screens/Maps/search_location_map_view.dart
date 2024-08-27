// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get_my_properties/controller/auth_controller.dart';
// // import 'package:get_my_properties/controller/location_controller.dart';
// // import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
// // import 'package:get_my_properties/features/widgets/custom_app_button.dart';
// // import 'package:get_my_properties/helper/route_helper.dart';
// // import 'package:get_my_properties/utils/sizeboxes.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// //
// // class SearchLocationScreen extends StatelessWidget {
// //   const SearchLocationScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: Get.find<AuthController>().handleOnWillPop,
// //       child: Scaffold(
// //         appBar: const CustomAppBar(title: "Pick Location To Continue", isBackButtonExist: true),
// //         body: GetBuilder<LocationController>(
// //           builder: (locationControl) {
// //             if (locationControl.latitude == null || locationControl.longitude == null) {
// //               return const Center(child: CircularProgressIndicator());
// //             }
// //             LatLng center = LatLng(locationControl.latitude!, locationControl.longitude!);
// //             return Stack(
// //               children: [
// //                 GoogleMap(
// //                   mapToolbarEnabled: false,
// //                   onMapCreated: locationControl.onMapCreated,
// //                   initialCameraPosition: CameraPosition(
// //                     target: center,
// //                     zoom: 14.0,
// //                   ),
// //                   markers: {
// //                     Marker(
// //                       markerId: const MarkerId('currentLocation'),
// //                       position: center,
// //                     ),
// //                   },
// //                 ),
// //                 Positioned(
// //                   top: 10,
// //                   left: 10,
// //                   right: 10,
// //                   child: LocationSearchBar(
// //                     onSearch: (query) {
// //                       locationControl.searchLocation(query);
// //                     },
// //                   ),
// //                 ),
// //                 Positioned(
// //                   bottom: 20,
// //                   left: 20,
// //                   right: 20,
// //                   child: Column(
// //                     children: [
// //                       Container(
// //                         padding: const EdgeInsets.all(16.0),
// //                         color: Colors.white,
// //                         child: Text(
// //                           locationControl.address ?? 'Search for a location...',
// //                           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                         ),
// //                       ),
// //                       sizedBoxDefault(),
// //                       CustomButtonWidget(
// //                         buttonText: 'Continue',
// //                         onPressed: () {
// //                           // Add action for the continue button if needed
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// // class LocationSearchBar extends StatelessWidget {
// //   final Function(String) onSearch;
// //
// //   const LocationSearchBar({super.key, required this.onSearch});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     TextEditingController searchController = TextEditingController();
// //
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: TextField(
// //         controller: searchController,
// //         decoration: InputDecoration(
// //           fillColor: Theme.of(context).cardColor,
// //           filled: true,
// //           hintText: 'Search location...',
// //           suffixIcon: IconButton(
// //             icon: const Icon(Icons.search),
// //             onPressed: () {
// //               onSearch(searchController.text);
// //             },
// //           ),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(8.0),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:http/http.dart' as http;
//
// class GoogleMapSearchPlacesApi extends StatefulWidget {
//   const GoogleMapSearchPlacesApi({Key? key}) : super(key: key);
//
//
//   @override
//   _GoogleMapSearchPlacesApiState createState() => _GoogleMapSearchPlacesApiState();
// }
//
// class _GoogleMapSearchPlacesApiState extends State<GoogleMapSearchPlacesApi> {
//
//
//   final _controller =  TextEditingController();
//   var uuid =  const Uuid();
//   String _sessionToken = '1234567890';
//   List<dynamic> _placeList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       _onChanged();
//     });
//   }
//
//   _onChanged() {
//     if (_sessionToken == null) {
//       setState(() {
//         _sessionToken = uuid.v4();
//       });
//     }
//     getSuggestion(_controller.text);
//   }
//
//   void getSuggestion(String input) async {
//
//
//     const String PLACES_API_KEY = "AIzaSyCDVQ4usmDvRgBR_e9bmJLtzVpq8KLHlRQ";
//
//     try{
//       String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
//       String request = '$baseURL?input=$input&key=$PLACES_API_KEY&sessiontoken=$_sessionToken';
//       var response = await http.get(Uri.parse(request));
//       var data = json.decode(response.body);
//       if (kDebugMode) {
//         print('mydata');
//         print(data);
//       }
//       if (response.statusCode == 200) {
//         setState(() {
//           _placeList = json.decode(response.body)['predictions'];
//         });
//       } else {
//         throw Exception('Failed to load predictions');
//       }
//     }catch(e){
//       print(e);
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: const Text('Search places Api' ,),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Align(
//             alignment: Alignment.topCenter,
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: "Search your location here",
//                 focusColor: Colors.white,
//                 floatingLabelBehavior: FloatingLabelBehavior.never,
//                 prefixIcon: const Icon(Icons.map),
//                 suffixIcon: IconButton(
//                   icon: const Icon(Icons.cancel), onPressed: () {
//                   _controller.clear() ;
//                 },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: _placeList.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () async {
//
//                   },
//                   child: ListTile(
//                     title: Text(_placeList[index]["description"]),
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }