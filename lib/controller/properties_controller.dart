import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_my_properties/utils/images.dart';

class PropertiesController extends GetxController implements GetxService {
  PropertiesController();


  final List<String> PropertyImages = [
    'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
    'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
    'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
    'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
    'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',


  ];


  final List<String> highLightImage = [
    'assets/icons/ic_parking_area.png',
    'assets/icons/ic_fully_furnished.png',
    'assets/icons/ic_powerlift.png',
  ];
  final List<String> highLightNames = [
    'Parking Area',
    'Fully Furnished',
    'Power Back up Lift',
  ];




}