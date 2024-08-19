import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/data/models/response/country_state_city_model.dart';
import 'package:get_my_properties/data/models/response/locality_model.dart';
import 'package:get_my_properties/data/models/response/property_detail_model.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/data/repo/location_repo.dart';
import 'package:get_my_properties/data/repo/property_repo.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo,});

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  String ? _countryId;
  String? get countryId => _countryId;
  void setCountryId(String val) {
    _countryId = val;
    update();
  }

  String ? _stateId;
  String? get stateId => _stateId;
  void setStateId(String val) {
    _stateId = val;
    update();
  }

  String ? _cityId;
  String? get cityId => _cityId;
  void setCityId(String val) {
    _cityId = val;
    update();
  }
  String? _localityId;
  String? get localityId => _localityId;
  void setLocalityId(String val) {
    _localityId = val;
    update();
  }


  List<LocationModel>? _countryList;
  List<LocationModel>? get countryList => _countryList;
  Future<void> getCountryList() async {
    _isLoading = true;
    update();
    try {
      Response response = await locationRepo.getCountryRepo();
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.body['data'];
        _countryList = responseData.map((json) => LocationModel.fromJson(json)).toList();
      } else {
       print("Errror in Country Load");
      }
    } catch (error) {
      print("Error while fetching Country  list: $error");
    }
    _isLoading = false;
    update();
  }

  List<LocationModel>? _stateList;
  List<LocationModel>? get stateList => _stateList;
  Future<void> getStateList() async {
    _isLoading = true;
    update();
    try {
      Response response = await locationRepo.getStateRepo();
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.body['data'];
        _stateList = responseData.map((json) => LocationModel.fromJson(json)).toList();
        if (stateList!.isNotEmpty ) {
          _stateId = stateList![0].id;
        }
      } else {
        print("Errror in Country Load");
      }
    } catch (error) {
      print("Error while fetching Country  list: $error");
    }
    _isLoading = false;
    update();
  }

  List<LocalityModel>? _localityList;
  List<LocalityModel>? get localityList => _localityList;
  Future<void> getLocalityList() async {
    _isLoading = true;
    update();
    try {
      Response response = await locationRepo.getLocalityRepo();
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.body['data'];
        _localityList = responseData.map((json) => LocalityModel.fromJson(json)).toList();
        if (localityList!.isNotEmpty ) {
          _localityId = localityList![0].id;
        }
      } else {
        print("Errror in Country Load");
      }
    } catch (error) {
      print("Error while fetching Country  list: $error");
    }
    _isLoading = false;
    update();
  }

  List<LocationModel>? _cityList;
  List<LocationModel>? get cityList => _cityList;

  Future<void> getCityList(String? stateId) async {
    _isLoading = true;
    update();
    try {
      Response response = await locationRepo.getCityRepo(stateId);
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.body['data'];
        _cityList = responseData.map((json) => LocationModel.fromJson(json)).toList();
        if (cityList!.isNotEmpty ) {
          _cityId = cityList![0].id;
        }
      } else {
        print("Errror in Country Load");
      }
    } catch (error) {
      print("Error while fetching Country  list: $error");
    }
    _isLoading = false;
    update();
  }
}




