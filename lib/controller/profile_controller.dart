import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../data/repo/profile_repo.dart';
import '../data/api/api_client.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;
  final ApiClient apiClient;

  ProfileController({required this.profileRepo, required this.apiClient});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  XFile? _pickedImage;
  XFile? get pickedImage => _pickedImage;

  void pickImage({required bool isRemove}) async {
    if (isRemove) {
      _pickedImage = null;
    } else {
      _pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    update();
  }

  Future<void> updateProfileApi(String? name, String? email, String? address, XFile? image) async {
    _isLoading = true;
    update();
    try {
      final response = await profileRepo.updateProfile(name, email, address, image);
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = response.body;
        if (responseData != null && responseData.isNotEmpty) {
          final parsedResponse = jsonDecode(responseData);

          if (parsedResponse["status"] == true) {
            Get.find<AuthController>().profileDetailsApi();
          } else {
            print('Profile error: ${parsedResponse}');
          }
        } else {
          print('Response body is null or empty');
        }
      } else {
        print('API response error: ${response.statusCode}');
      }
    } catch (e) {
      print('Profile error: $e');
    } finally {
      _isLoading = false;
      update();
    }
  }
  Future<dynamic> updateProfile({
    required String name,
    required String email,
    required String address,
    required XFile? image,
  }) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(AppConstants.token);

    if (token == null || token.isEmpty) {
      print('Token is null or empty');
      return false;
    }

    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    var request = http.MultipartRequest(
      'PATCH', // Ensure PATCH method is what your API requires
      Uri.parse('${AppConstants.baseUrl}${AppConstants.userProfileUpdateUrl}'),
    );

    request.fields.addAll({
      'name': name,
      'email': email,
      'address': address,
    });

    if (image != null && image.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        image.path,
      ));
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

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Response Body: $responseBody');
        return jsonDecode(responseBody);
      } else {
        var responseBody = await response.stream.bytesToString();
        print('Error: ${response.reasonPhrase}');
        print('Response Body: $responseBody');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
