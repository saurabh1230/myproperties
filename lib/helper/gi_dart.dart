
import 'package:get/get.dart';
import 'package:get_my_properties/controller/explore_controller.dart';
import 'package:get_my_properties/controller/home_controller.dart';



Future<void>   init() async {
  /// Repository




  // Repository

  // Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // Get.lazyPut(() => NewsRepo(apiClient: Get.find()));
  // Get.lazyPut(() => ComplaintRepo(apiClient: Get.find()));
  // Get.lazyPut(() => HomeRepo(apiClient: Get.find()));
  // Get.lazyPut(() => ParliamentRepo(apiClient: Get.find()));
  // Get.lazyPut(() => ProfileRepo(apiClient: Get.find()));
  // Get.lazyPut(() => DonationRepo(apiClient: Get.find()));
  // Get.lazyPut(() => HelpRepo(apiClient: Get.find()));

  /// Controller

  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => ExploreController());


}
