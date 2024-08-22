// import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_my_properties/features/widgets/custom_snackbar.dart';
// import 'package:image_picker/image_picker.dart';
// class PropertiesController extends GetxController implements GetxService {
//   PropertiesController();
//
//
//   final List<String> PropertyImages = [
//     'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
//     'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
//     'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
//     'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
//     'https://img.freepik.com/free-photo/urban-traffic-with-cityscape_1359-324.jpg?ga=GA1.1.1760436030.1711531065&semt=sph',
//   ];
//
//
//   final List<String> highLightImage = [
//     'assets/icons/ic_parking_area.png',
//     'assets/icons/ic_fully_furnished.png',
//     'assets/icons/ic_powerlift.png',
//   ];
//   final List<String> highLightNames = [
//     'Parking Area',
//     'Fully Furnished',
//     'Power Back up Lift',
//   ];
//
//   final List<String> propertyTypeList = [
//     'Apartment',
//     'House Individual',
//     'Power Back up Lift',
//     'PG',
//     'Plot/Land',
//     'Multi Story',
//   ];
//
//
//   int _propertyType = 0;
//   int get propertyType => _propertyType;
//
//   void selectPropertyType(int index) {
//     _propertyType = index;
//     update();
//   }
//
//   final List<String> categoryTypeList = [
//     'Residential',
//     'Commercial',
//   ];
//
//   int _categoryType = 0;
//   int get categoryType => _categoryType;
//
//   void selectCategoryType(int index) {
//     _propertyType = index;
//     update();
//   }
//
//   List<String?> _tagList = [];
//   List<String?> get tagList => _tagList;
//
//   void setTag(String? name, {bool isUpdate = true}){
//     _tagList.add(name);
//     if(isUpdate) {
//       update();
//     }
//   }
//
//   void initializeTags(){
//     _tagList = [];
//   }
//
//   void removeTag(int index){
//     _tagList.removeAt(index);
//     update();
//   }
//
//   XFile? _pickedLogo;
//   XFile? get pickedLogo => _pickedLogo;
//
//   void pickMainImage( ) async {
//     XFile? pickLogo = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(pickLogo != null) {
//       pickLogo.length().then((value) {
//         if (value > 2000000) {
//           showCustomSnackBar('please_upload_lower_size_file');
//         } else {
//           _pickedLogo = pickLogo;
//         }
//       });
//     }
//     update();
//   }
//
//   XFile? _pickedVideo;
//   XFile? get pickedVideo => _pickedVideo;
//
//   void pickMainVideo() async {
//     XFile? pickVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);
//     if (pickVideo != null) {
//       // Example: Check video file size (adjust as per your requirement)
//       pickVideo.length().then((value) {
//         if (value > 20000000) {
//           showCustomSnackBar('Please upload a video smaller than 20MB');
//         } else {
//           _pickedVideo = pickVideo;
//           update(); // Notify the UI to update with the picked video
//         }
//       });
//     }
//   }
//
//   List<XFile> _pickedLogos = [];
//   List<XFile> get pickedLogos => _pickedLogos;
//
//   void pickPropertyGalleryImages() async {
//     XFile? pickLogo = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickLogo != null) {
//       pickLogo.length().then((value) {
//         if (value > 2000000) {
//           showCustomSnackBar('please_upload_lower_size_file');
//         } else {
//           _pickedLogos.add(pickLogo);
//           update();
//         }
//       });
//     }
//   }
//
//   void removeLogo(int index) {
//     _pickedLogos.removeAt(index);
//     update();
//   }
//
//
//
//
//
//
// }