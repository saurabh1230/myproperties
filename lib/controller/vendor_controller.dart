import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/data/models/response/admin_dashboard_model.dart';
import 'package:get_my_properties/data/models/response/all_enquiry_model.dart';
import 'package:get_my_properties/data/models/response/property_detail_model.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/data/models/response/recent_search_model.dart';
import 'package:get_my_properties/data/repo/property_repo.dart';
import 'package:get_my_properties/data/repo/vendor_repo.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class VendorController extends GetxController implements GetxService {
  final VendorRepo vendorRepo;

  VendorController({required this.vendorRepo,});

  bool _isLoading = false;
  bool get isLoading => _isLoading;



  XFile? _pickedDisplayImage;
  XFile? get pickedDisplayImage => _pickedDisplayImage;

  void pickDisplayImage({required bool isRemove}) async {
    if (isRemove) {
      _pickedDisplayImage = null;
    } else {
      _pickedDisplayImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    update();
  }
  List<XFile> _pickedGalleryImages = [];
  List<XFile> get pickedGalleryImages => _pickedGalleryImages;

  // Method to pick a single image
  Future<void> pickGalleryImage() async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        _pickedGalleryImages.add(image);
        update();
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  // Method to remove an image by index
  void removeImage(int index) {
    _pickedGalleryImages.removeAt(index);
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
    _isLoading = true;
    update();
  }


  List<AllEnquiryMode>? _enquiryList;
  List<AllEnquiryMode>? get enquiryList => _enquiryList;
  Future<void> getAllEnquiryList({
    String? page,

  }) async {
    _isLoading = true;
    try {
      if (page == '1') {
        _pageList = []; // Reset page list for new search
        _offset = 1;
        _enquiryList = []; // Reset product list for the first page
        update();
      }
      if (!_pageList.contains(page)) {
        _pageList.add(page!);

        Response response = await vendorRepo.getEnquiryRepo();

        if (response.statusCode == 200) {
          List<dynamic> dataList = response.body['data'];
          List<AllEnquiryMode> newDataList = dataList.map((json) => AllEnquiryMode.fromJson(json)).toList();

          if (page == '1') {
            _enquiryList = newDataList;
          } else {
            _enquiryList!.addAll(newDataList);
          }

          _isLoading = false;
          update();
        } else {
          // Handle the error appropriately
        }
      } else {
        if (_isLoading) {
          _isLoading = false;
          update();
        }
      }
    } catch (e) {
      print('Error fetching property list: $e');
      _isLoading = false;
      update();
    }
  }



  String _vendorPropertyStatusID = 'active';
  String get vendorPropertyStatusID => _vendorPropertyStatusID;
  void setVendorPropertyID(String val) {
    _vendorPropertyStatusID = val;
    update();
  }
  // List of status
  final List<String> vendorPropertyStatus = [
    "active",
    "inactive",
    "verified",
    "unverified",
    "rejected",
  ];











}
