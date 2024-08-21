import 'dart:async';
import 'package:get_my_properties/data/api/api_client.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VendorRepo {
  final ApiClient apiClient;
  VendorRepo({required this.apiClient,});

  Future<Response> getEnquiryRepo() async {
    return apiClient.getData(
      AppConstants.vendorAllEnquiryUrl,method: 'GET'
    );
  }




}
