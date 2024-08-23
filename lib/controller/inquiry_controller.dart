import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_my_properties/data/repo/inquiry_repo.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InquiryController extends GetxController implements GetxService {
  final InquiryRepo inquiryRepo;

  InquiryController({required this.inquiryRepo});



  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Future<void> userPropertyInquiryApi(
  //     String? propertyID,String? name,String? phoneNo,String? email,String? message,) async {
  //   _isLoading = true;
  //   update();
  //   try {
  //     Response response;
  //     response = await inquiryRepo.userPropertyInquiryRepo(propertyID, name, phoneNo, email, message);
  //
  //     var responseData = response.body;
  //     // if (responseData["status"] == true) {
  //     //   showCustomSnackBar(responseData['message']);
  //     // } else {
  //     //   showCustomSnackBar('Please Try Again');
  //     // }
  //   } catch (e) {
  //     print('ch${e}');
  //     // showCustomSnackBar('An error occurred, please try again.');
  //   } finally {
  //     _isLoading = false;
  //     update();
  //   }
  // }

  Future<dynamic> userPropertyInquiryApi({
    required String propertyID,
    required String name,
    required String phoneNo,
    required String email,
    required String message,
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
      'Content-Type': 'application/json',
    };

    var body = jsonEncode({
      "property_id": propertyID,
      "name": name,
      "phone_number": phoneNo,
      "email": email,
      "message": message,
    });

    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.userCreateInquiryUrl}'),
        headers: headers,
        body: body,
      );

      print('Request URL: ${AppConstants.baseUrl}${AppConstants.userCreateInquiryUrl}');
      print('Request Headers: $headers');
      print('Request Body: $body');
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print('Response Body: ${response.body}');
        if (responseData["status"] == true) {
          showCustomSnackBar('Inquiry Created Successfully');
          return responseData;
        } else {
          showCustomSnackBar('Please Try Again');
          return false;
        }
      } else {
        print('Error: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    } finally {
      _isLoading = false;
      Get.back();
      update();
    }
  }



}
