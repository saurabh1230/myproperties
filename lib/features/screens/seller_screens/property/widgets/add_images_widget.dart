import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

class EditPhotosScreen extends StatefulWidget {
  const EditPhotosScreen({super.key});

  @override
  State<EditPhotosScreen> createState() => _EditPhotosScreenState();
}

class _EditPhotosScreenState extends State<EditPhotosScreen> {
  List<String> images = [
    'assets/images/my_photos.png',
    'assets/images/ic_demo_profile.png',
    'assets/images/ic_matches_profile.png',
    'assets/images/ic_profile_male1.png',
    'assets/images/ic_welcome2.png'
  ];
  List<String> selectedItems = [];

  // // List selectedItems = [];
  // File pickedImage = File("");
  // final ImagePicker _imgPicker = ImagePicker();
  bool allImagesSelected = false;

  final _picker = ImagePicker();
  final CarouselSliderController  _controller = CarouselSliderController ();
  List<File> _pickedImages = [];
  int _index = 0;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pickedImages.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
      InkWell(onTap: () async {
    List<XFile> images = await _picker.pickMultiImage();
    setState(() {
    for (var v in images) {
    _pickedImages.add(File(v.path));
    }
    });
    if (_pickedImages.isNotEmpty) {
    // log(_pickedImages.toString());
    }
    },
        child: Container(
        width: Get.size.width,
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(Dimensions.radius10)
          ),
          // padding: EdgeInsets.all(Dimensions.paddingSize20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Images.placeholder,height: 50),
              sizedBox4(),
              Text("Add Gallery Main Image Of Property",style: senMedium.copyWith(
                  fontSize: Dimensions.fontSize12,
                  color: Theme.of(context).disabledColor.withOpacity(0.40)),)
            ],
          ), ),
      ) ])
          : Column(
              children: [
                sizedBoxDefault(),
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: _pickedImages.length,
                  itemBuilder: (ctx, index, realIndex) {
                    return Container(
                      padding: EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            child: Image.file(width: 280,
                              _pickedImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _pickedImages.removeAt(index);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.red),
                                child: Icon(
                                  size: Dimensions.fontSize14,
                                  Icons.delete_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    //height: 40.h,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _index = index;
                      });
                    },
                    aspectRatio: 2,
                    enableInfiniteScroll: false,
                  ),
                ),
                sizedBoxDefault(),
                CustomButtonWidget(
                  onPressed: () async {
                    List<XFile> images = await _picker.pickMultiImage();
                    setState(() {
                      for (var v in images) {
                        _pickedImages.add(File(v.path));
                      }
                    });
                    if (_pickedImages.isNotEmpty) {}
                  },
                  width: 140,
                  height: 40,
                  fontSize: Dimensions.fontSize10,
                  buttonText: "Add More",
                isBold: false,
                icon: Icons.add,),

              ],
            ),
    );
  }
}

// Create a new StatelessWidget for the PhotoViewScreen
