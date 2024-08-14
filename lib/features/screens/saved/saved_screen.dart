import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/explore/widgets/explore_card_widget.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';


class SavedScreen extends StatefulWidget {
  final bool? isHistory;
  SavedScreen({Key? key,  this.isHistory = false}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1);

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
        isBackButtonExist: widget.isHistory! ? true : false,
        title: widget.isHistory! ? "History" : "Saved",
        menuWidget: CustomNotificationButton(
          tap: () {},
        ),
      ),
      body: Column(
        children: [
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
                      detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent",'')),
                      propertyCategory: "Apartment",
                      title: 'La Convent',
                      description: '3,4 BHK Apartment in Entally, Kolkata Central',
                      price: '₹ 2.9 - 3.6 Cr',
                      // pageController: _pageController
                  );
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
