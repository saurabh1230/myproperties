import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_my_properties/data/models/response/home_data_model.dart';
import 'package:get_my_properties/data/models/response/profile_data_model.dart';
import 'package:get_my_properties/data/repo/auth_repo.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;
  AuthController({required this.authRepo,required this.sharedPreferences, }) ;

  int _loginType = 0;
  int get loginType => _loginType;

  void selectLoginType(int index) {
    _loginType = index;
    print(loginType);
    update();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  static final List<String> _loginTypeList = ['User',"Dealer"];
  List<String> get loginTypeList => _loginTypeList;


  bool _isLoginLoading = false;
  bool get isLoginLoading => _isLoginLoading;

  Future<void> userLoginApi(String phoneNo) async {
    _isLoginLoading = true;
    update();

    try {
      Response response = await authRepo.userLoginRepo(phoneNo);
      var responseData = response.body;

      if (responseData["status"] == true) {
        String otp = responseData['data']['otp'].toString();
        Get.toNamed(RouteHelper.getOtpVerificationRoute(phoneNo));
        showCustomSnackBar('OTP: $otp');
      } else {
        showCustomSnackBar(responseData['message']);
      }
    } catch (e) {
      showCustomSnackBar('An error occurred, please try again.');
    } finally {
      _isLoginLoading = false;
      update();
    }
  }

  Future<void> userOtpApi(String? phoneNo,String? otp,) async {
    _isLoginLoading = true;
    update();
    try {
      Response response = await authRepo.userLoginVerifyOtp(phoneNo, otp);
      var responseData = response.body;
      if (responseData["status"] == true) {
        authRepo.saveUserToken(responseData['data']['token']);
        Get.toNamed(RouteHelper.getDashboardRoute());
      } else {
        showCustomSnackBar(responseData['message']);
      }
    } catch (e) {
      showCustomSnackBar('An error occurred, please try again.');
    } finally {
      _isLoginLoading = false;
      update();
    }
  }

  bool _profileDetailsLoading = false;
  bool get profileDetailsLoading => _profileDetailsLoading;


  ProfileDataModel? _profileData;
  ProfileDataModel? get profileData => _profileData;


  Future<ProfileDataModel?> profileDetailsApi() async {
    _profileDetailsLoading = true;
    _profileData = null;
    update();
    Response response = await authRepo.getUserData();
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.body['data']; // Change List<dynamic> to Map<String, dynamic>
      _profileData = ProfileDataModel.fromJson(responseData);
    } else {
    }
    _profileDetailsLoading = false;
    update();
    return _profileData;
  }

  TypeDataModel? _homeData;
  TypeDataModel? get homeData => _homeData;


  Future<TypeDataModel?> getHomeDataApi() async {
    _isLoading = true;
    _homeData = null;
    update();
    Response response = await authRepo.getHomeDataRepo();
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.body['data'];
      _homeData = TypeDataModel.fromJson(responseData);
    } else {
    }
    _isLoading = false;
    update();
    return _homeData;
  }

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




}