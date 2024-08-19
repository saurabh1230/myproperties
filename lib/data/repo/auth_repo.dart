import 'dart:async';
import 'package:get_my_properties/data/api/api_client.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<bool> saveUserToken(String token,) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }
  Future<void> saveLoginType(int loginType) async {
    await sharedPreferences.setInt(AppConstants.loginType, loginType);
  }

  int getLoginType() {
    return sharedPreferences.getInt(AppConstants.loginType) ?? 0; // Default to 0 if not set
  }




  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.token);
    return true;
  }

  Future<Response> userLoginRepo(String? phoneNo,) async {
    return await apiClient.postData(AppConstants.userLoginUrl, {"phone_number": phoneNo, "user_type" : 'customer'});
  }

  Future<Response> userLoginVerifyOtp(String? phoneNo,String? otp,) async {
    return await apiClient.postData(AppConstants.userOtpUrl, {"phone_number": phoneNo, "otp" : otp});
  }

  Future<Response> getUserData() async {
    return await apiClient.getData(AppConstants.userDetailsUrl,method: 'GET');
  }

  Future<Response> getHomeDataRepo() async {
    return await apiClient.getData(AppConstants.userGetHomeData);
  }

  Future<Response> vendorLoginRepo(String? phoneNo,) async {
    return await apiClient.postData(AppConstants.vendorLoginUrl, {"phone_number": phoneNo, "user_type" : 'vender'});
  }

  Future<Response> vendorLoginVerifyOtp(String? phoneNo,String? otp,) async {
    return await apiClient.postData(AppConstants.vendorOtpUrl, {"phone_number": phoneNo, "otp" : otp});
  }

  Future<Response> getVendorDashboardDataRepo() async {
    return await apiClient.getData(AppConstants.vendorDashboardDataUrl,method: 'GET');
  }



}
