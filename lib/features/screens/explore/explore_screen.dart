import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/explore/widgets/explore_card_widget.dart';
import 'package:get_my_properties/features/screens/home/widgets/filter_bottom_sheet.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';


class ExploreScreen extends StatefulWidget {
  final bool? isBrowser;
  final String? title;
  final String? propertyTypeId;
  final String? purposeId;

  const ExploreScreen({Key? key, this.isBrowser= false, this.title, this.propertyTypeId, this.purposeId}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('=====================> Category Id  ${widget.propertyTypeId}');
      print('=====================> Category Id  ${widget.purposeId}');
      Get.find<PropertyController>().getPropertyList(page: '1',
          purposeId: widget.purposeId,
          typeId:widget.propertyTypeId);
    });
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        isBackButtonExist: widget.isBrowser! ? true : false,
        title:widget.isBrowser! ? '${widget.title}' : "Explore",
        menuWidget: CustomNotificationButton(
          tap: () {},
        ),
      ),
      body: GetBuilder<PropertyController>(builder: (propertyControl) {
        final list = propertyControl.propertyList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = propertyControl.isPropertyLoading;
        return
          isListEmpty && !isLoading
              ? Center(
                  child: EmptyDataWidget(
                    image: Images.emptyDataImage,
                    fontColor: Theme.of(context).disabledColor,
                    text: 'No Properties yet',
                  )) :
          Column(
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
                  itemCount: list!.length,
                  itemBuilder: (_, i) {
                    return ExploreCardWidget(
                        itemCount: 10,
                        image:  list[i].displayImage!.image.toString(),
                        ratingText: "4.2",
                        imagesLength:  list[i].galleryImages!.length.toString(),
                        likeTap: () {},
                        detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent",'')),
                        propertyCategory:  list[i].category!.name.toString(),
                        title:  list[i].title.toString(),
                        description: list[i].description.toString(),
                        price: '₹ ${list[i].price.toString()}',
                        // pageController: _pageController
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimensions.paddingSizeDefault),
                ),
              ),
            ),
          ],
        );
      }),




    );
  }
}
