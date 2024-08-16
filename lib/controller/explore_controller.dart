import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController implements GetxService {
  ExploreController();

  int _selectedButton = 0;
  int get selectedButton => _selectedButton;

  void selectButton(int index) {
    _selectedButton = index;
    update();
  }

  int _propertyTypeIndex = 0;
  int get propertyTypeIndex => _propertyTypeIndex;

  void selectPropertyType(int index) {
    _propertyTypeIndex = index;
    update();
  }

  String _propertyTypeID = '';
  String get propertyTypeID => _propertyTypeID;

  void selectPropertyTypeId(String val) {
    _propertyTypeID = val;
    update();
  }

  String _propertyPurposeID = '';
  String get propertyPurposeID => _propertyPurposeID;
  void selectPropertyPurposeId(String val) {
    _propertyPurposeID = val;
    update();
  }

  static final List<String> _propertyFor = ['Rent', "Buy"];
  List<String> get propertyFor => _propertyFor;

  static final List<String> _propertyType = ['Apartment', "House", "Multi-family", "PG", "Plot/ Land", "Multi Story"];
  List<String> get propertyType => _propertyType;

  int _spaceTypeIndex = 0;
  int get spaceTypeIndex => _spaceTypeIndex;

  void selectSpaceType(int index) {
    _spaceTypeIndex = index;
    update();
  }

  final List<String> spaceType = ['1', '2', '3', '4', '5', '6', '7', '+8'];

  String _spaceTypeID = '';
  String get spaceTypeID => _spaceTypeID;
  void selectSpaceTypeID(String val) {
    _spaceTypeID = val;
    update();
  }

  final List<String> bathroomType = ['1', '2', '3', '+4'];
  String _bathroomID = '';
  String get bathroomID => _bathroomID;
  void selectBathroomTypeID(String val) {
    _bathroomID = val;
    update();
  }

  int _budgetTypeMin = 0;
  int get budgetTypeMin => _budgetTypeMin;

  void selectBudgetTypeMin(int index) {
    _budgetTypeMin = index;
    update();
  }

  int _budgetTypeMax = 0;
  int get budgetTypeMax => _budgetTypeMax;

  void selectBudgetTypeMax(int index) {
    _budgetTypeMax = index;
    update();
  }

  int _sqfeetmin = 0;
  int get sqftMin => _sqfeetmin;

  void selectsqFtMin(int index) {
    _sqfeetmin = index;
    update();
  }

  int _sqfeetMax = 0;
  int get sqFitMax => _sqfeetMax;

  void selectsqFtMax(int index) {
    _sqfeetMax = index;
    update();
  }

  static final List<String> _budgetTypeList = ['1 BHK', '2 BHK', '3 BHK', '4 BHK'];
  List<String> get budgetTypeList => _budgetTypeList;

  static final List<String> _bathroomTypeList = ['1', '2', '3', '4'];
  List<String> get bathroomTypeList => _bathroomTypeList;

  int _bathroomTypeIndex = 0;
  int get bathroomTypeIndex => _bathroomTypeIndex;

  void selectBathRoomTypeIndex(int index) {
    _bathroomTypeIndex = index;
    update();
  }

  int _otherOptionIndex = 0;
  int get otherOptionIndex => _otherOptionIndex;

  void SelectOptionIndex(int index) {
    _otherOptionIndex = index;
    update();
  }

  final RxDouble startPriceValue = 0.0.obs;
  final RxDouble endPriceValue = 10000000.0.obs;

  void setPriceValue(RangeValues newValues) {
    startPriceValue.value = newValues.start;
    endPriceValue.value = newValues.end;
    update();
  }

  // Optional: Format numbers as currency
  String formatCurrency(double value) {
    return '₹${value.toStringAsFixed(0)}'; // Formatting as integer
  }

  String ? _stateId;
  String? get stateId => _stateId;

  void setStateId(String val) {
    _stateId = val;
    update();
  }

  String ? _nearByLocationId;
  String? get nearByLocationId => _nearByLocationId;

  void setNearByLocationId(String val) {
    _nearByLocationId = val;
    update();
  }

  String ? _amenityId;
  String? get amenityId => _amenityId;

  void setAmenityId(String val) {
    _amenityId = val;
    update();
  }

  // String ? _propertyCategoryId;
  // String? get propertyCategoryId => _propertyCategoryId;
  //
  // void setPropertyCategoryId(String val) {
  //   _propertyCategoryId = val;
  //   update();
  // }


  // final List<String> _propertyCategoryIds = [];
  // List<String> get propertyCategoryIds => _propertyCategoryIds;
  //
  // void setPropertyCategoryIds(String val) {
  //   if (_propertyCategoryIds.contains(val)) {
  //     _propertyCategoryIds.remove(val);
  //   } else {
  //     _propertyCategoryIds.add(val);
  //   }
  //   update();
  // }
  final RxList<String> _propertyCategoryName = <String>[].obs;
  List<String> get propertyCategoryName => _propertyCategoryName.toList();

  void setPropertyCategoryName(String val) {
    if (_propertyCategoryName.contains(val)) {
      _propertyCategoryName.remove(val);
    } else {
      _propertyCategoryName.add(val);
    }
  }

  final RxList<String> _propertyCategoryIds = <String>[].obs;
  List<String> get propertyCategoryIds => _propertyCategoryIds.toList();

  void setPropertyCategoryIds(String val) {
    if (_propertyCategoryIds.contains(val)) {
      _propertyCategoryIds.remove(val);
    } else {
      _propertyCategoryIds.add(val);
    }
  }


}
