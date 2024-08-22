import 'package:get/get.dart';
import 'package:get_my_properties/data/models/response/property_model.dart';
import 'package:get_my_properties/data/repo/property_repo.dart';
import 'package:get_my_properties/features/widgets/custom_snackbar.dart';

class BookmarkController extends GetxController implements GetxService {
  final PropertyRepo propertyRepo;

  BookmarkController({required this.propertyRepo});

  List<PropertyModel?>? _bookmarkList = [];

  List<PropertyModel?>? get bookmarkList => _bookmarkList;

  List<String?> _bookmarkIdList = [];

  List<String?> get bookmarkIdList => _bookmarkIdList;

  void addToBookmarkList(PropertyModel? propertyList) async {
    Response response = await propertyRepo.userBookmarkPropertyRepo(propertyList!.sId);
    if (response.statusCode == 200) {
      _bookmarkList!.add(propertyList);
      _bookmarkIdList.add(propertyList.sId);  // Use the String sId directly
      showCustomSnackBar('Property Saved', isError: false);
    }
    update();
  }

  void removeFromBookMarkList(String? propertyId) async {
    Response response = await propertyRepo.userBookmarkPropertyRepo(propertyId);
    if (response.statusCode == 200) {
      int idIndex = _bookmarkIdList.indexOf(propertyId);
      if (idIndex != -1) {
        _bookmarkIdList.removeAt(idIndex);
        _bookmarkList!.removeAt(idIndex);
      }
      showCustomSnackBar('Property Unsaved', isError: false);
    }
    update();
  }
}
