import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/explore/widgets/explore_card_widget.dart';
import 'package:get_my_properties/features/screens/home/widgets/filter_bottom_sheet.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';


class ExploreScreen extends StatefulWidget {
  final bool? isBrowser;
  final String? title;
  ExploreScreen({Key? key, this.isBrowser= false, this.title}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1);
  List<String> _imageUrls = [
    'assets/images/explore_building_image.png',
    'assets/images/explore_building_image.png',
    'assets/images/explore_building_image.png',
    'assets/images/explore_building_image.png',
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        isBackButtonExist: widget.isBrowser! ? true : false,
        title:widget.isBrowser! ? '${widget.title}' : "Explore",
        menuWidget: CustomNotificationButton(
          tap: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
            child: Row(
              children: [
                Expanded(child: CustomOutlineButton(title: 'Location',
                  tap: () {  },)),
                sizedBoxW5(),
                Expanded(child: CustomOutlineButton(
                  title: 'Filters',
                  filter: true,
                  filterText: "  (2)",
                  tap: () {
                    Get.bottomSheet(
                      const FilterBottomSheet(),
                      backgroundColor: Colors.transparent, isScrollControlled: true,
                    );
                  },)),
                sizedBoxW5(),
                Expanded(child: CustomButtonWidget(
                  height: 35,
                  radius: Dimensions.radius5,
                  isBold: false,
                  buttonText: "Save Search",onPressed: () {},
                  fontSize:  Dimensions.fontSize12,))

              ],
            ),
          ),
          sizedBox8(),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (_, i) {
                  return ExploreCardWidget(
                      itemCount: 10,
                      image: "assets/images/exploreimage1.png",
                      ratingText: "4.2",
                      imagesLength: "4",
                      likeTap: () {},
                      detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent")),
                      propertyCategory: "Apartment",
                      title: 'La Convent',
                      description: '3,4 BHK Apartment in Entally, Kolkata Central',
                      price: '₹ 2.9 - 3.6 Cr',
                      pageController: _pageController);
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: Dimensions.paddingSizeDefault),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
