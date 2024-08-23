import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/dimensions.dart';

class PropertySearchController extends GetxController implements GetxService {
  PropertySearchController();


  List<String> propertyPurposeList = ['Buy', 'Rent'];
  String _propertyPurposeId = 'Buy';

  String get propertyPurposeId => _propertyPurposeId;

  void setPropertyPurpose(String val) {
    _propertyPurposeId = val;
    update();
  }

}
