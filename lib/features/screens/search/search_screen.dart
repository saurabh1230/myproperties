import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/screens/explore/explore_screen.dart';
import 'package:get_my_properties/features/screens/home/widgets/recommended_item_card.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class SearchScreen extends StatelessWidget {
  final bool? isBackButton;
   SearchScreen({super.key, this.isBackButton = true});


  final List<String> staticCommunityList = [
    'Apartments',
    'Plots',
    'Houses',
    'Flats',
  ];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PropertyController>().getRecentSearchList();
    });
    return Scaffold(
      appBar:  CustomAppBar(title: "Search",isBackButtonExist:isBackButton! ?   true: false),
      body: GetBuilder<PropertyController>(builder: (propertyControl) {
        print('===============>${propertyControl.recentSearchList!.length}');
        final list = propertyControl.searchPropertyList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = propertyControl.isPropertyLoading;
        return Column(children: [
           Padding(
            padding: const EdgeInsets.all( Dimensions.paddingSizeDefault),
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: TextField(
                onChanged: (val) {
                  if (val.isEmpty) {
                    propertyControl.clearSearchPropertyList();
                  } else {
                    propertyControl.getSearchPropertyList(
                      page: '1',
                      limit: '10',
                      latitude: '',
                      longitude: '',
                      query: val,
                    );
                  }
                },
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'City | Locality | Landmark',
                  hintStyle: TextStyle(
                    color: Theme.of(context).disabledColor.withOpacity(0.4),
                  ),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
          // Row(mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Recent Searches", style: senRegular.copyWith(color: Theme.of(context).primaryColor),),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.cancel,color: Theme.of(context).primaryColor,))
          //   ],
          // ),
          Wrap(
            spacing: 4.0, // Adjust spacing as needed
            children: propertyControl.recentSearchList!.map((val) {
              print(val.value.toString());
              return ChoiceChip(
                selectedColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.white,
                label: Text(
                  val.value.toString(),
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.80),
                  ),
                ),
                selected: false, // Adjust according to your logic
                onSelected: (selected) {
                  // Handle selection logic if needed
                },
              );
            }).toList(),),
          isListEmpty && !isLoading
              ? Padding(
                padding: const EdgeInsets.only(top: Dimensions.paddingSize40),
                child: Center(
                child: EmptyDataWidget(
                  image: Images.icSearchPlaceHolder,
                  fontColor: Theme.of(context).disabledColor,
                  text: '',
                )),
              ) :
          Expanded(
            child: isLoading ||isListEmpty ? const ExploreScreenShimmer() :
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, i) {
                return
                  RecommendedItemCard(
                    vertical: true,
                    image: list[i].displayImage!.image.toString(),
                    title:  list[i].title.toString(),
                    description:  list[i].description.toString(),
                    price: '₹ ${list[i].price.toString()}',
                    propertyId: list[i].sId.toString(),
                    ratingText: '4.5',likeTap:() {},
                  );
                // return ExploreCardWidget(
                //     itemCount: 10,
                //     image:  list[i].displayImage!.image.toString(),
                //     ratingText: "4.2",
                //     imagesLength:  list[i].galleryImages!.length.toString(),
                //     likeTap: () {},
                //     detailsTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("La Convent",'')),
                //     propertyCategory:  list[i].category!.name.toString(),
                //     title:  list[i].title.toString(),
                //     description: list[i].description.toString(),
                //     price: '₹ ${list[i].price.toString()}',
                //     // pageController: _pageController
                // );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimensions.paddingSizeDefault),
            ),
          ),

        ],);
      })




    );
  }
}
