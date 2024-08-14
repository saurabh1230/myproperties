import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/data/models/response/property_detail_model.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/data/repo/property_repo.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import '../data/repo/profile_repo.dart';
import '../data/api/api_client.dart';

class PropertyController extends GetxController implements GetxService {
  final PropertyRepo propertyRepo;

  PropertyController({required this.propertyRepo,});

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

  int _offset = 1;
  int get offset => _offset;
  List<String> _pageList = [];
  int? _pageSize;
  int? get pageSize => _pageSize;

  void setOffset(int offset) {
    _offset= offset;
  }
  void showBottomLoader () {
    _isPropertyLoading = true;
    update();
  }
  bool _isPropertyLoading = false;
  bool get isPropertyLoading => _isPropertyLoading;

  List<PropertyModel>? _propertyList;
  List<PropertyModel>? get propertyList => _propertyList;
  //
  // Future<void> getPropertyList(
  //     String page,
  //     String? stateId,
  //     String? cityId,
  //     String? localityId,
  //     String? purposeId,
  //     String? categoryId,
  //     String? amenityId,
  //     String? typeId,
  //     String? limit,
  //     String? userId,
  //     String? minPrice,
  //     String? maxPrice,
  //     String? sortBy,
  //     String? lat,
  //     String? long,
  //     String? direction,
  //     String? bathroom,
  //     String? space
  //     ) async {
  //   _isPropertyLoading = true;
  //   try {
  //     if (page == '1') {
  //       _pageList = []; // Reset page list for new search
  //       _offset = 1;
  //       _propertyList = []; // Reset product list for first page
  //       update();
  //     }
  //
  //     if (!_pageList.contains(page)) {
  //       _pageList.add(page);
  //
  //       Response response = await propertyRepo.getUserProperty(
  //           stateId,
  //           cityId,
  //           localityId,
  //           purposeId,
  //           categoryId,
  //           amenityId,
  //           typeId,
  //           page,
  //           limit,
  //           userId,
  //           minPrice,
  //           maxPrice,
  //           sortBy,
  //           lat,
  //           long,
  //           direction,
  //           bathroom,
  //           space);
  //
  //       if (response.statusCode == 200) {
  //         // Adjust the parsing to match the response structure
  //         Map<String, dynamic> responseData = response.body['data']['datalist'];
  //         List<dynamic> dataList = responseData['data'];
  //         List<PropertyModel> newDataList = dataList.map((json) => PropertyModel.fromJson(json)).toList();
  //
  //         if (page == '1') {
  //           // Reset product list for first page
  //           _propertyList = newDataList;
  //         } else {
  //           // Append data for subsequent pages
  //           _propertyList!.addAll(newDataList);
  //         }
  //
  //         _isPropertyLoading = false;
  //         update();
  //       } else {
  //         // ApiChecker.checkApi(response);
  //       }
  //     } else {
  //       // Page already loaded or in process, handle loading state
  //       if (_isPropertyLoading) {
  //         _isPropertyLoading = false;
  //         update();
  //       }
  //     }
  //   } catch (e) {
  //     print('Error fetching osce  list: $e');
  //     _isPropertyLoading = false;
  //     update();
  //   }
  // }


  Future<void> getPropertyList({
    String? page,
    String? stateId,
    String? cityId,
    String? localityId,
    String? purposeId,
    String? categoryId,
    String? amenityId,
    String? typeId,
    String? limit,
    String? userId,
    String? minPrice,
    String? maxPrice,
    String? sortBy,
    String? lat,
    String? long,
    String? direction,
    String? bathroom,
    String? space,
  }) async {
    _isPropertyLoading = true;
    try {
      if (page == '1') {
        _pageList = []; // Reset page list for new search
        _offset = 1;
        _propertyList = []; // Reset product list for the first page
        update();
      }

      if (!_pageList.contains(page)) {
        _pageList.add(page!);

        Response response = await propertyRepo.getUserProperty(
          stateId: stateId,
          cityId: cityId,
          localityId: localityId,
          purposeId: purposeId,
          categoryId: categoryId,
          amenityId: amenityId,
          typeId: typeId,
          page: page,
          limit: limit,
          userId: userId,
          minPrice: minPrice,
          maxPrice: maxPrice,
          sortBy: sortBy,
          lat: lat,
          long: long,
          direction: direction,
          bathroom: bathroom,
          space: space,
        );

        if (response.statusCode == 200) {
          List<dynamic> dataList = response.body['data'];
          List<PropertyModel> newDataList = dataList.map((json) => PropertyModel.fromJson(json)).toList();

          if (page == '1') {
            _propertyList = newDataList;
          } else {
            _propertyList!.addAll(newDataList);
          }

          _isPropertyLoading = false;
          update();
        } else {
          // Handle the error appropriately
        }
      } else {
        if (_isPropertyLoading) {
          _isPropertyLoading = false;
          update();
        }
      }
    } catch (e) {
      print('Error fetching property list: $e');
      _isPropertyLoading = false;
      update();
    }
  }





  PropertyDetailModel? _propertyDetails;
  PropertyDetailModel? get propertyDetails => _propertyDetails;


  Future<PropertyDetailModel?> getPropertyDetailsApi(String? propertyId) async {
    _isLoading = true;
    _propertyDetails = null;
    update();
    Response response = await propertyRepo.getPropertyDetails(propertyId);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = response.body['data'];
      _propertyDetails = PropertyDetailModel.fromJson(responseData);
    } else {
    }
    _isLoading = false;
    update();
    return _propertyDetails;
  }


}
