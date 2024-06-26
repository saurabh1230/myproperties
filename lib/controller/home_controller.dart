import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_my_properties/utils/images.dart';

class HomeController extends GetxController implements GetxService {
  HomeController();


  final List<String> suitablePropertyImages = [
    Images.suitableImage1,
    Images.suitableImage2,
    Images.suitableImage3,
    Images.suitableImage4,
  ];

  final List<String> suitablePropertyNames = [
    "Buying a home",
    "Renting a home",
    "PG-Co Living",
    "Plot/Land",
  ];

  final List<String> servicesImages = [
    Images.servicesImage1,
    Images.servicesImage2,
    Images.servicesImage3,
    Images.servicesImage4,
  ];

  final List<String> servicesNames = [
    "Home Inspection",
    "Rent Agreement",
    "Tenant Verification",
    "Property Valuation",
  ];


}