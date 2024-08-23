import 'dart:async';
import 'package:get_my_properties/data/api/api_client.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:get/get.dart';


class InquiryRepo {
  final ApiClient apiClient;
  InquiryRepo({required this.apiClient,});


  Future<Response> getCountryRepo() {
    return apiClient.getData(AppConstants.userCreateInquiryUrl,method: 'GET');
  }


  Future<Response> userPropertyInquiryRepo(String? propertyID,String? name,String? phoneNo,String? email,String? message,) async {
    return await apiClient.postData(AppConstants.userCreateInquiryUrl, {
      "property_id": propertyID, "name" : name, "phone_number": phoneNo, "email" : email, "message" : message
    });
  }









}
