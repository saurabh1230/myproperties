import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/dashboard/drawer.dart';
import 'package:get_my_properties/features/screens/home/widgets/browse_more_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/newly_constructed.dart';
import 'package:get_my_properties/features/screens/home/widgets/popular_in_location_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/recomended_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/services_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/suitable_property_section.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  final TextEditingController filter = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.homeAppBarBg),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                  child: Column(
                    children: [
                      sizedBox65(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              GestureDetector(behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                child: Image.asset(
                                  Images.drawerMenuIcon,
                                  height: Dimensions.paddingSize30,
                                  width: Dimensions.paddingSize30,
                                ),
                              ),
                              sizedBoxW7(),
                              Image.asset(
                                Images.logo,
                                height: Dimensions.paddingSize20,
                                width: Dimensions.paddingSize20,
                              ),
                              sizedBoxW7(),
                              Text(
                                "GetMyProperties",
                                style: senBold.copyWith(
                                    color: Theme.of(context).cardColor,
                                    fontSize: Dimensions.fontSize18),
                              ),
                            ],
                          ),
                          Text(
                            "Sign Up",
                            style: senBold.copyWith(
                                color: Theme.of(context).cardColor,
                                fontSize: Dimensions.fontSize14),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Column(children: [
                    InkWell(onTap: () {
                      Get.toNamed(RouteHelper.getSearchRoute());
                    },
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.paddingSize5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5)
                          ],
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "  Search  ",
                                    style: senRegular.copyWith(
                                        fontSize: Dimensions.fontSize13,
                                        color: Theme.of(context)
                                            .hintColor), // Different color for "resend"
                                  ),
                                  TextSpan(
                                    text: "City | Locality | Landmark",
                                    style: senRegular.copyWith(
                                        fontSize: Dimensions.fontSize12,
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(0.40)), // Default text color
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.search,
                              color: Theme.of(context).hintColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SuitablePropertySection(),
                RecomendedSection(),
                PopularInLocationSectionSection(),
                ServicesSection(),
                NewlyConstructedSection(),
                BrowseMoreSection(
                  title: 'Buy A House',
                  description:
                      'Discover your location with the most listings, including exclusive items, and an immersive photo experience.',
                  image: Images.buyAHousePlaceHolderImage,
                ),
                BrowseMoreSection(
                  title: 'Rent A House',
                  description:
                      'Creating a seamless online rental process: browse top listings, apply, and pay rent easily for a hassle-free experience.',
                  image: Images.rentAHousePlaceHolderImage,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
