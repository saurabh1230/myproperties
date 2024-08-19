import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/data/models/response/property_detail_model.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/data/repo/property_repo.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class PropertyController extends GetxController implements GetxService {
  final PropertyRepo propertyRepo;

  PropertyController({required this.propertyRepo,});

  bool _isLoading = false;
  bool get isLoading => _isLoading;



  XFile? _pickedDisplayImage;
  XFile? get pickedDisplayImage => _pickedDisplayImage;

  void pickDisplayImage({required bool isRemove}) async {
    if (isRemove) {
      _pickedDisplayImage = null;
    } else {
      _pickedDisplayImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    update();
  }
  List<XFile> _pickedGalleryImages = [];
  List<XFile> get pickedGalleryImages => _pickedGalleryImages;

  // Method to pick a single image
  Future<void> pickGalleryImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        _pickedGalleryImages.add(image);
        update();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // Method to remove an image by index
  void removeImage(int index) {
    _pickedGalleryImages.removeAt(index);
    update();
  }



  int _offset = 1;
  int get offset => _offset;
  List<String> _pageList = [];
  int? _pageSize;
  int? get pageSize => _pageSize;

  void setOffset(int offset) {
    _offset= offset;
  }
  void showBottomLoader () {
    _isPropertyLoading = true;
    update();
  }
  bool _isPropertyLoading = false;
  bool get isPropertyLoading => _isPropertyLoading;

  List<PropertyModel>? _propertyList;
  List<PropertyModel>? get propertyList => _propertyList;
  //
  // Future<void> getPropertyList(
  //     String page,
  //     String? stateId,
  //     String? cityId,
  //     String? localityId,
  //     String? purposeId,
  //     String? categoryId,
  //     String? amenityId,
  //     String? typeId,
  //     String? limit,
  //     String? userId,
  //     String? minPrice,
  //     String? maxPrice,
  //     String? sortBy,
  //     String? lat,
  //     String? long,
  //     String? direction,
  //     String? bathroom,
  //     String? space
  //     ) async {
  //   _isPropertyLoading = true;
  //   try {
  //     if (page == '1') {
  //       _pageList = []; // Reset page list for new search
  //       _offset = 1;
  //       _propertyList = []; // Reset product list for first page
  //       update();
  //     }
  //
  //     if (!_pageList.contains(page)) {
  //       _pageList.add(page);
  //
  //       Response response = await propertyRepo.getUserProperty(
  //           stateId,
  //           cityId,
  //           localityId,
  //           purposeId,
  //           categoryId,
  //           amenityId,
  //           typeId,
  //           page,
  //           limit,
  //           userId,
  //           minPrice,
  //           maxPrice,
  //           sortBy,
  //           lat,
  //           long,
  //           direction,
  //           bathroom,
  //           space);
  //
  //       if (response.statusCode == 200) {
  //         // Adjust the parsing to match the response structure
  //         Map<String, dynamic> responseData = response.body['data']['datalist'];
  //         List<dynamic> dataList = responseData['data'];
  //         List<PropertyModel> newDataList = dataList.map((json) => PropertyModel.fromJson(json)).toList();
  //
  //         if (page == '1') {
  //           // Reset product list for first page
  //           _propertyList = newDataList;
  //         } else {
  //           // Append data for subsequent pages
  //           _propertyList!.addAll(newDataList);
  //         }
  //
  //         _isPropertyLoading = false;
  //         update();
  //       } else {
  //         // ApiChecker.checkApi(response);
  //       }
  //     } else {
  //       // Page already loaded or in process, handle loading state
  //       if (_isPropertyLoading) {
  //         _isPropertyLoading = false;
  //         update();
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching osce  list: $e');
  //     _isPropertyLoading = false;
  //     update();
  //   }
  // }


  Future<void> getPropertyList({
    String? page,
    String? stateId,
    String? cityId,
    String? localityId,
    String? purposeId,
    String? categoryId,
    String? amenityId,
    String? typeId,
    String? limit,
    String? userId,
    String? minPrice,
    String? maxPrice,
    String? sortBy,
    String? lat,
    String? long,
    String? direction,
    String? bathroom,
    String? space,
  }) async {
    _isPropertyLoading = true;
    try {
      if (page == '1') {
        _pageList = []; // Reset page list for new search
        _offset = 1;
        _propertyList = []; // Reset product list for the first page
        update();
      }

      if (!_pageList.contains(page)) {
        _pageList.add(page!);

        Response response = await propertyRepo.getUserProperty(
          stateId: stateId,
          cityId: cityId,
          localityId: localityId,
          purposeId: purposeId,
          categoryId: categoryId,
          amenityId: amenityId,
          typeId: typeId,
          page: page,
          limit: limit,
          userId: userId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          sortBy: sortBy,
          lat: lat,
          long: long,
          direction: direction,
          bathroom: bathroom,
          space: space,
        );

        if (response.statusCode == 200) {
          List<dynamic> dataList = response.body['data'];
          List<PropertyModel> newDataList = dataList.map((json) => PropertyModel.fromJson(json)).toList();

          if (page == '1') {
            _propertyList = newDataList;
          } else {
            _propertyList!.addAll(newDataList);
          }

          _isPropertyLoading = false;
          update();
        } else {
          // Handle the error appropriately
        }
      } else {
        if (_isPropertyLoading) {
          _isPropertyLoading = false;
          update();
        }
      }
    } catch (e) {
      print('Error fetching property list: $e');
      _isPropertyLoading = false;
      update();
    }
  }





  PropertyDetailModel? _propertyDetails;
  PropertyDetailModel? get propertyDetails => _propertyDetails;


  Future<PropertyDetailModel?> getPropertyDetailsApi(String? propertyId) async {
    _isLoading = true;
    _propertyDetails = null;
    update();
    Response response = await propertyRepo.getPropertyDetails(propertyId);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.body['data'];
      _propertyDetails = PropertyDetailModel.fromJson(responseData);
    } else {
    }
    _isLoading = false;
    update();
    return _propertyDetails;
  }


  /// ######  VENDOR  ##########////
///
  Future<void> getVendorPropertyList({
    String? page,
    // String? stateId,
    // String? cityId,
    // String? localityId,
    // String? purposeId,
    // String? categoryId,
    // String? amenityId,
    // String? typeId,
    // String? limit,
    // String? userId,
    // String? minPrice,
    // String? maxPrice,
    // String? sortBy,
    // String? lat,
    // String? long,
    // String? direction,
    // String? bathroom,
    // String? space,
  }) async {
    _isPropertyLoading = true;
    try {
      if (page == '1') {
        _pageList = []; // Reset page list for new search
        _offset = 1;
        _propertyList = []; // Reset product list for the first page
        update();
      }

      if (!_pageList.contains(page)) {
        _pageList.add(page!);

        Response response = await propertyRepo.getVendorProperty(
          // stateId: stateId,
          // cityId: cityId,
          // localityId: localityId,
          // purposeId: purposeId,
          // categoryId: categoryId,
          // amenityId: amenityId,
          // typeId: typeId,
          // page: page,
          // limit: limit,
          // userId: userId,
          // minPrice: minPrice,
          // maxPrice: maxPrice,
          // sortBy: sortBy,
          // lat: lat,
          // long: long,
          // direction: direction,
          // bathroom: bathroom,
          // space: space,
        );

        if (response.statusCode == 200) {
          List<dynamic> dataList = response.body['data'];
          List<PropertyModel> newDataList = dataList.map((json) => PropertyModel.fromJson(json)).toList();

          if (page == '1') {
            _propertyList = newDataList;
          } else {
            _propertyList!.addAll(newDataList);
          }

          _isPropertyLoading = false;
          update();
        } else {
          // Handle the error appropriately
        }
      } else {
        if (_isPropertyLoading) {
          _isPropertyLoading = false;
          update();
        }
      }
    } catch (e) {
      print('Error fetching property list: $e');
      _isPropertyLoading = false;
      update();
    }
  }

  Future<dynamic> postPropertyApi({
    required String typeId,
    required String purposeId,
    required String categoryId,
    required String amenityId,
    required String slug,
    required String title,
    required String description,
    required String metaTitle,
    required String metaDesc,
    required String address,
    required String unit,
    required String videoLink,
    required String room,
    required String space,
    required String bedroom,
    required String bathroom,
    required String floor,
    required String kitchen,
    required String buildYear,
    required String area,
    required String direction,
    required String price,
    required String marketPrice,
    required String isFeatured,
    required String topProperty,
    required String expiryDate,
    required String stateId,
    required String cityId,
    required String localityId,
    required String latitude,
    required String longitude,
    required XFile? displayImage,
    required List<XFile>? galleryImages,
  }) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(AppConstants.token);

    _isLoading = true;
    update();

    if (token == null || token.isEmpty) {
      print('Token is null or empty');
      _isLoading = false;
      update();
      return false;
    }

    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConstants.baseUrl}${AppConstants.vendorPropertyUrl}'),
    );

    request.fields.addAll({
      "type_id": typeId,
      "purpose_id": purposeId,
      "category_id": categoryId,
      "amenity_id": jsonEncode(["66b0999290ff51eb47b9bb13"]),
      "slug": slug,
      "title": title,
      "description": description,
      "meta_title": metaTitle,
      "meta_description": metaDesc,
      "address": address,
      "unit": unit,
      "video_link": videoLink,
      "room": room,
      "space": space,
      "bedroom": bedroom,
      "bathroom": bathroom,
      "floor": floor,
      "kitchen": kitchen,
      "built_year": buildYear,
      "area": area,
      "direction": direction,
      "price": price,
      "market_price": marketPrice,
      "is_featured": isFeatured,
      "top_property": topProperty,
      "expiry_date": expiryDate,
      "state_id": stateId,
      "city_id": cityId,
      "locality_id": jsonEncode(["66b09b8fc7068370892553c0", "66b09b9bc7068370892553c3"]),
      "latitude": latitude,
      "longitude": longitude,
    });

    // Add display image if it exists
    if (displayImage != null && displayImage.path.isNotEmpty) {
      var mimeType = displayImage.path.split('.').last; // e.g., jpg, png
      request.files.add(await http.MultipartFile.fromPath(
        'property_display_image', // Ensure this field name matches what the API expects
        displayImage.path,
        contentType: MediaType('image', mimeType),
      ));
    }

    // Add gallery images if they exist
    if (galleryImages != null && galleryImages.isNotEmpty) {
      for (var image in galleryImages) {
        if (image.path.isNotEmpty) {
          var mimeType = image.path.split('.').last; // e.g., jpg, png
          request.files.add(await http.MultipartFile.fromPath(
            'gallery_images', // Ensure this field name matches what the API expects
            image.path,
            contentType: MediaType('image', mimeType),
          ));
        }
      }
    }

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      // Print the request details for debugging
      print('Request URL: ${request.url}');
      print('Request Method: ${request.method}');
      print('Request Headers: ${request.headers}');
      print('Request Fields: ${request.fields}');
      print('Request Files: ${request.files}');

      var responseBody = await response.stream.bytesToString();
      print('Raw Response Body: $responseBody'); // Print raw response for debugging

      // Try to decode response as JSON
      try {
        return jsonDecode(responseBody);
      } catch (jsonError) {
        print('JSON Decode Error: $jsonError');
        print('Response Body (raw): $responseBody');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    } finally {
      _isLoading = false;
      update();
    }
  }




// Future<dynamic> postPropertyApi({
  //
  //   required String typeId,
  //   required String purposeId,
  //   required String categoryId,
  //   required String amenityId,
  //   required String slug,
  //   required String title,
  //   required String description,
  //   required String metaTitle,
  //   required String metaDesc,
  //   required String adress,
  //   required String unit,
  //   required String videoLink,
  //   required String room,
  //   required String space,
  //   required String bedroom,
  //   required String bathroom,
  // required String floor,
  // required String kitchen,
  // required String buildYear,
  // required String area,
  // required String direction,
  // required String price,
  // required String marketPrice,
  // required String isFeatured,
  // required String topProperty,
  // required String expirydate,
  // required String stateId,
  // required String cityId,
  // required String localityId,
  // required String latitude,
  // required String longitude,
  //   required XFile? displayImage,
  //   required List<XFile>? galleryImages, // Updated to accept a list of gallery images
  // }) async {
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? token = sharedPreferences.getString(AppConstants.token);
  //
  //   _isLoading = true;
  //   update();
  //
  //   if (token == null || token.isEmpty) {
  //     print('Token is null or empty');
  //     _isLoading = false;
  //     update();
  //     return false;
  //   }
  //
  //   var headers = {
  //     'Authorization': 'Bearer $token',
  //     'Accept': 'application/json',
  //   };
  //
  //   var request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse('${AppConstants.baseUrl}${AppConstants.vendorPropertyUrl}'),
  //   );
  //
  //   request.fields.addAll({
  //     "type_id": typeId,
  //     "purpose_id": purposeId,
  //     "category_id": categoryId,
  //     "amenity_id": amenityId,
  //     "slug": slug,
  //     "title": title,
  //     "description": description,
  //     "meta_title": metaTitle,
  //     "meta_description": metaDesc,
  //     "address": adress,
  //     "unit": unit,
  //     "video_link": videoLink,
  //     "room": room,
  //     "space": space,
  //     "bedroom": bedroom,
  //     "bathroom": bathroom,
  //     "floor": floor,
  //     "kitchen": kitchen,
  //     "built_year": buildYear,
  //     "area": area,
  //     "direction": direction,
  //     "price": price,
  //     "market_price": marketPrice,
  //     "is_featured": isFeatured,
  //     "top_property": topProperty,
  //     "expiry_date": expirydate,
  //     "state_id": stateId,
  //     "city_id": cityId,
  //     "locality_id": localityId,
  //     "latitude": latitude,
  //     "longitude": longitude
  //   });
  //
  //   // Add display image if it exists
  //   if (displayImage != null && displayImage.path.isNotEmpty) {
  //     var mimeType = displayImage.path.split('.').last; // e.g., jpg, png
  //     request.files.add(await http.MultipartFile.fromPath(
  //       'property_display_image', // Ensure this field name matches what the API expects
  //       displayImage.path,
  //       contentType: MediaType('image', mimeType),
  //     ));
  //   }
  //
  //   // Add gallery images if they exist
  //   if (galleryImages != null && galleryImages.isNotEmpty) {
  //     for (var image in galleryImages) {
  //       if (image.path.isNotEmpty) {
  //         var mimeType = image.path.split('.').last; // e.g., jpg, png
  //         request.files.add(await http.MultipartFile.fromPath(
  //           'gallery_images', // Ensure this field name matches what the API expects
  //           image.path,
  //           contentType: MediaType('image', mimeType),
  //         ));
  //       }
  //     }
  //   }
  //
  //   request.headers.addAll(headers);
  //
  //   try {
  //     http.StreamedResponse response = await request.send();
  //
  //     // Print the request details for debugging
  //     print('Request URL: ${request.url}');
  //     print('Request Method: ${request.method}');
  //     print('Request Headers: ${request.headers}');
  //     print('Request Fields: ${request.fields}');
  //     print('Request Files: ${request.files}');
  //
  //     var responseBody = await response.stream.bytesToString();
  //     print('Raw Response Body: $responseBody'); // Print raw response for debugging
  //
  //     // Try to decode response as JSON
  //     try {
  //       return jsonDecode(responseBody);
  //     } catch (jsonError) {
  //       print('JSON Decode Error: $jsonError');
  //       print('Response Body (raw): $responseBody');
  //       return false;
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     return false;
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }
  //







}
