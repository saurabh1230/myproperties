import 'dart:convert'; // For jsonDecode
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Adjust the import based on your project structure
import 'package:get_my_properties/utils/app_constants.dart';

class UpdateProfileApi {
  Future<dynamic> get({
    required String idToken,
    required String name,
    required String email,
    required String address,
    required String phoneNumber,
    required String imagePath,
  }) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(AppConstants.token);
    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest(
      'PATCH', // Use PATCH method if required by your API
      Uri.parse('${AppConstants.baseUrl}${AppConstants.userProfileUpdateUrl}'),
    );
    request.fields.addAll({
      'name': name,
      'email': email,
      'address': address,
      'phone_number': phoneNumber,
    });
    if (imagePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        imagePath,
      ));
    }
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        return jsonDecode(responseBody);
      } else {
        print('Error: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
