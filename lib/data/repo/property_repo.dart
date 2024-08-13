import 'dart:async';
import 'package:get_my_properties/data/api/api_client.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';


class PropertyRepo {
  final ApiClient apiClient;
  PropertyRepo({required this.apiClient,});



  // Future<Response> getUserProperty(
  //      String? stateId,
  //      String? cityId,
  //      String? localityId,
  //      String? purposeId,
  //      String? categoryId,
  //      String? amenityId,
  //      String? typeId,
  //     String? page,
  //     String? limit,
  //     String? userId,
  //     String? minPrice,
  //     String? maxPrice,
  //     String? sortBy,
  //     String? lat,
  //     String? long,
  //     String? direction,
  //     String? bathroom,
  //     String? space,
  //     ) async {
  //   Map<String, String> fields = {};
  //   fields.addAll(<String, String>{
  //     "state_id": stateId!,
  //     "city_id": cityId!,
  //     "locality_id": localityId!,
  //     "purpose_id": purposeId!,
  //     "category_id": categoryId!,
  //     "amenity_id": amenityId!,
  //     "type_id": typeId!,
  //     "min_price": minPrice!,
  //     "max_price": maxPrice!,
  //     "page": page!,
  //     "limit": limit!,
  //     "sort_by": sortBy!,
  //     "lat": lat!,
  //     "long": long!,
  //     "direction": direction!,
  //     "bathroom": bathroom!,
  //     "space": space!,
  //     "user_id": userId!,
  //   });
  //   return apiClient.postData(
  //     AppConstants.userGetPropertyUrl , fields,
  //   );
  // }
  Future<Response> getUserProperty({
    String? stateId,
    String? cityId,
    String? localityId,
    String? purposeId,
    String? categoryId,
    String? amenityId,
    String? typeId,
    String? page,
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
    // Initialize the map to hold the fields
    Map<String, String> fields = {};

    // Add fields conditionally based on their presence
    if (stateId != null) fields['state_id'] = stateId;
    if (cityId != null) fields['city_id'] = cityId;
    if (localityId != null) fields['locality_id'] = localityId;
    if (purposeId != null) fields['purpose_id'] = purposeId;
    if (categoryId != null) fields['category_id'] = categoryId;
    if (amenityId != null) fields['amenity_id'] = amenityId;
    if (typeId != null) fields['type_id'] = typeId;
    if (minPrice != null) fields['min_price'] = minPrice;
    if (maxPrice != null) fields['max_price'] = maxPrice;
    if (page != null) fields['page'] = page;
    if (limit != null) fields['limit'] = limit;
    if (sortBy != null) fields['sort_by'] = sortBy;
    if (lat != null) fields['lat'] = lat;
    if (long != null) fields['long'] = long;
    if (direction != null) fields['direction'] = direction;
    if (bathroom != null) fields['bathroom'] = bathroom;
    if (space != null) fields['space'] = space;
    if (userId != null) fields['user_id'] = userId;

    // Make the API request
    return apiClient.postData(
      AppConstants.userGetPropertyUrl,
      fields,
    );
  }




}
