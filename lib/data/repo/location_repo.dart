import 'dart:async';
import 'package:get_my_properties/data/api/api_client.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';


class LocationRepo {
  final ApiClient apiClient;
  LocationRepo({required this.apiClient,});




  Future<Response> getCountryRepo() {
    return apiClient.getData(AppConstants.countryListUrl,method: 'GET');
  }

  Future<Response> getStateRepo() {
    return apiClient.getData(AppConstants.stateListUrl,method: 'GET');
  }
  Future<Response> getCityRepo(stateId) {
    return apiClient.getData('${AppConstants.cityListUrl}?state_id=$stateId',method: 'GET');
  }
  Future<Response> getLocalityRepo() {
    return apiClient.getData(AppConstants.localityIdUrl,method: 'GET');
  }









}
