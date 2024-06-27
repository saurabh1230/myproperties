// // import 'package:flutter/material.dart';
// // import 'package:get_my_properties/utils/dimensions.dart';
// // import 'package:get_my_properties/utils/images.dart';
// // import 'package:get_my_properties/utils/sizeboxes.dart';
// // import 'package:get_my_properties/utils/styles.dart';
// //
// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       body: Column(
// //         children: [
// //           Container(
// //             height: 200,
// //             decoration: const BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage(Images.homeAppBarBg),
// //                 fit: BoxFit.cover,
// //                 alignment: Alignment.topCenter,
// //               ),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
// //               child: Column(children: [
// //                 sizedBox100(),
// //                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     crossAxisAlignment: CrossAxisAlignment.center,
// //                     children: [
// //                     Row(
// //                       children: [
// //                         Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
// //                         sizedBoxW7(),
// //                         Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
// //                         sizedBoxW7(),
// //                         Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
// //                       ],
// //                     ),
// //                     Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
// //                   ],),
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/cupertino.dart';
// import 'package:get_my_properties/features/screens/home/widgets/browse_more_section.dart';
// import 'package:get_my_properties/features/screens/home/widgets/newly_constructed.dart';
// import 'package:get_my_properties/features/screens/home/widgets/popular_in_location_section.dart';
// import 'package:get_my_properties/features/screens/home/widgets/recomended_section.dart';
// import 'package:get_my_properties/features/screens/home/widgets/services_section.dart';
// import 'package:get_my_properties/features/screens/home/widgets/suitable_property_section.dart';
// import 'package:get_my_properties/features/widgets/customizable_spacebar_widget.dart';
// import 'package:get_my_properties/utils/dimensions.dart';
// import 'package:get_my_properties/utils/images.dart';
// import 'package:get_my_properties/utils/sizeboxes.dart';
// import 'package:get_my_properties/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double scrollPoint = 0.0;
//
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           slivers: [
//             /// App Bar
//             SliverAppBar(
//               pinned: true,
//               toolbarHeight: 10,
//               expandedHeight: 140,
//               floating: false,
//               elevation: 0,
//               /*automaticallyImplyLeading: false,*/
//               backgroundColor: Theme.of(context).primaryColor,
//               flexibleSpace: FlexibleSpaceBar(
//                   titlePadding: EdgeInsets.zero,
//                   centerTitle: true,
//                   expandedTitleScale: 1,
//                   title: CustomizableSpaceBarWidget(
//                     builder: (context, scrollingRate) {
//                       scrollPoint = scrollingRate;
//                       return Center(
//                           child: Container(
//                             height: 300,
//                         decoration: const BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(Images.homeAppBarBg),
//                             fit: BoxFit.cover,
//                             alignment: Alignment.topCenter,
//                           ),
//                         ),
//                         // padding: const EdgeInsets.only(top: 60),
//                         child:   Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//                           child: Column(
//                             children: [
//                               sizedBox100(),
//                               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
//                                       sizedBoxW7(),
//                                       Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
//                                       sizedBoxW7(),
//                                       Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
//                                     ],
//                                   ),
//                                   Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
//
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ));
//                     },
//                   )),
//               actions: const [SizedBox()],
//             ),
//
//             // Search Button
//             SliverPersistentHeader(
//               pinned: true,
//               delegate: SliverDelegate(
//                   height: 60,
//                   child: Center(
//                       child: Stack(
//                     children: [
//                       Container(
//                         height: 60,
//                         color: Theme.of(context).colorScheme.background,
//                         child: Column(children: [
//                           Expanded(
//                               child: Container(
//                                   /*color: Theme.of(context).primaryColor*/)),
//                           Expanded(child: Container(color: Colors.transparent)),
//                         ]),
//                       ),
//                       Positioned(
//                         left: 10,
//                         right: 10,
//                         top: 10,
//                         bottom: 5,
//                         child: Container(
//                           height: 60,
//                           transform: Matrix4.translationValues(0, -3, 0),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: Dimensions.paddingSize5),
//                           decoration: BoxDecoration(
//                             color: Theme.of(context).cardColor,
//                             borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   spreadRadius: 1,
//                                   blurRadius: 5)
//                             ],
//                           ),
//                           child: Row(children: [
//                             RichText(
//                               text:  TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: "  Search  ",
//                                     style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
//                                   ),
//                                   TextSpan(
//                                     text: "City | Locality | Landmark",
//                                     style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
//                                   ),
//
//                                 ],
//                               ),
//                             ),
//                             const Spacer(),
//                             Container( height: 60,
//                               transform: Matrix4.translationValues(0, -3, 0),
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: Dimensions.paddingSize5),
//                               // decoration: BoxDecoration(
//                               //   color: Theme.of(context).cardColor,
//                               //   borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//                               //   boxShadow: [
//                               //     BoxShadow(
//                               //         color: Colors.black.withOpacity(0.1),
//                               //         spreadRadius: 1,
//                               //         blurRadius: 5)
//                               //   ],
//                               // ),
//                               child: Icon(Icons.search,color: Theme.of(context).hintColor,),
//                             ),
//                           ]),
//                         ),
//                       )
//                     ],
//                   ))),
//             ),
//
//             const SliverToBoxAdapter(
//               child: Center(
//                   child: SizedBox(
//                 width: Dimensions.webMaxWidth,
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   SuitablePropertySection(),
//                   RecomendedSection(),
//                   PopularInLocationSectionSection(),
//                   ServicesSection(),
//                   NewlyConstructedSection(),
//                   BrowseMoreSection(
//                     title: 'Buy A House',
//                     description: 'Discover your location with the most listings, including exclusive items, and an immersive photo experience.',
//                     image: Images.buyAHousePlaceHolderImage,),
//                   BrowseMoreSection(
//                     title: 'Rent A House',
//                     description: 'Creating a seamless online rental process: browse top listings, apply, and pay rent easily for a hassle-free experience.',
//                     image: Images.rentAHousePlaceHolderImage,),
//
//
//
//                 ]),
//               )),
//             ),
//             // SliverToBoxAdapter(
//             //   child: Center(child: SizedBox(
//             //     width: Dimensions.webMaxWidth,
//             //     child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             //       Image.asset("assets/image/fssai.png",height: 80,)
//             //
//             //     ]),
//             //   )),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SliverDelegate extends SliverPersistentHeaderDelegate {
//   Widget child;
//   double height;
//
//   SliverDelegate({required this.child, this.height = 50});
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }
//
//   @override
//   double get maxExtent => height;
//
//   @override
//   double get minExtent => height;
//
//   @override
//   bool shouldRebuild(SliverDelegate oldDelegate) {
//     return oldDelegate.maxExtent != height ||
//         oldDelegate.minExtent != height ||
//         child != oldDelegate.child;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/browse_more_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/newly_constructed.dart';
import 'package:get_my_properties/features/screens/home/widgets/popular_in_location_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/recomended_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/services_section.dart';
import 'package:get_my_properties/features/screens/home/widgets/suitable_property_section.dart';

import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
//             return <Widget>[
//               createSilverAppBar1(),
//               createSilverAppBar2(context)
//             ];
//           },
//           body: ListView.builder(
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(""),
//                   ),
//                 );
//               })),
//     );
//   }
//
//   SliverAppBar createSilverAppBar1() {
//     return SliverAppBar(
//       automaticallyImplyLeading: false,
//       // backgroundColor: Colors.redAccent,
//       expandedHeight: 100,
//       floating: false,
//       elevation: 0,
//       flexibleSpace: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints constraints) {
//             return FlexibleSpaceBar(
//               collapseMode: CollapseMode.parallax,
//               background: Container(
//                 // height: 120,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(Images.homeAppBarBg),
//                     fit: BoxFit.cover,
//                     alignment: Alignment.topCenter,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//                   child: Column(children: [
//                    sizedBox30(),
//                     sizedBox30(),
//                     Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Row(
//                           children: [
//                             Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
//                             sizedBoxW7(),
//                             Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
//                             sizedBoxW7(),
//                             Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
//                           ],
//                         ),
//                         Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
//                       ],),
//                     sizedBox30(),
//                     // Container(
//                     //   height: 45,
//                     //   padding: const EdgeInsets.symmetric(
//                     //       horizontal: Dimensions.paddingSize5),
//                     //   decoration: BoxDecoration(
//                     //     color: Theme.of(context).cardColor,
//                     //     borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //           color: Colors.black.withOpacity(0.1),
//                     //           spreadRadius: 1,
//                     //           blurRadius: 5)
//                     //     ],
//                     //   ),
//                     //   child: Row(children: [
//                     //     RichText(
//                     //       text:  TextSpan(
//                     //         children: [
//                     //           TextSpan(
//                     //             text: "  Search  ",
//                     //             style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
//                     //           ),
//                     //           TextSpan(
//                     //             text: "City | Locality | Landmark",
//                     //             style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
//                     //           ),
//                     //
//                     //         ],
//                     //       ),
//                     //     ),
//                     //     const Spacer(),
//                     //     Icon(Icons.search,color: Theme.of(context).hintColor,)
//                     //   ],
//                     //   ),
//                     // ),
//                   ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//     );
//   }
//
//   SliverAppBar createSilverAppBar2(BuildContext context) {
//     return SliverAppBar(
//       backgroundColor: Colors.transparent,
//       // backgroundColor: Colors.redAccent,
//       automaticallyImplyLeading: false,
//       pinned: true,
//       title :Container(
//         height: 45,
//         padding: const EdgeInsets.symmetric(
//             horizontal: Dimensions.paddingSize5),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 5)
//           ],
//         ),
//         child: Row(children: [
//           RichText(
//             text:  TextSpan(
//               children: [
//                 TextSpan(
//                   text: "  Search  ",
//                   style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
//                 ),
//                 TextSpan(
//                   text: "City | Locality | Landmark",
//                   style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
//                 ),
//
//               ],
//             ),
//           ),
//           const Spacer(),
//           Icon(Icons.search,color: Theme.of(context).hintColor,)
//         ],
//         ),
//       ),
//     );
//   }
//
//   Container headerBottomBarWidget(BuildContext context) {
//     return Container(
//             // height: 200,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(Images.homeAppBarBg),
//                 fit: BoxFit.cover,
//                 alignment: Alignment.topCenter,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//               child: Column(children: [
//                 // sizedBox100(),
//                   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                     Row(
//                       children: [
//                         Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
//                         sizedBoxW7(),
//                         Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
//                         sizedBoxW7(),
//                         Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
//                       ],
//                     ),
//                     Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
//                     ],),
//                 Container(
//                   height: 60,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: Dimensions.paddingSize5),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).cardColor,
//                     borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           spreadRadius: 1,
//                           blurRadius: 5)
//                     ],
//                   ),
//                   child: Row(children: [
//                     RichText(
//                       text:  TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "  Search  ",
//                             style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
//                           ),
//                           TextSpan(
//                             text: "City | Locality | Landmark",
//                             style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
//                           ),
//
//                         ],
//                       ),
//                     ),
//                     Icon(Icons.search,color: Theme.of(context).hintColor,)
//                   ],
//                   ),
//                 ),
//
//           ],
//               ),
//             ),
//     );
//   }
//
//   Widget headerWidget(BuildContext context) {
//     return Container(
//       // height: 120,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(Images.homeAppBarBg),
//           fit: BoxFit.cover,
//           alignment: Alignment.topCenter,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
//         child: Column(children: [
//           sizedBox100(),
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 children: [
//                   Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
//                   sizedBoxW7(),
//                   Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
//                   sizedBoxW7(),
//                   Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
//                 ],
//               ),
//                   Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
//             ],),
//           sizedBox30(),
//           Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(
//                 horizontal: Dimensions.paddingSize5),
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 5)
//               ],
//             ),
//             child: Row(children: [
//               RichText(
//                 text:  TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "  Search  ",
//                       style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
//                     ),
//                     TextSpan(
//                       text: "City | Locality | Landmark",
//                       style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
//                     ),
//
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Icon(Icons.search,color: Theme.of(context).hintColor,)
//             ],
//             ),
//           ),
//         ],
//         ),
//       ),
//     );
//   }
//
//   ListView listView() {
//     return ListView.builder(
//       padding: const EdgeInsets.only(top: 0),
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: 20,
//       shrinkWrap: true,
//       itemBuilder: (context, index) => Card(
//         color: Colors.white70,
//         child: ListTile(
//           leading: CircleAvatar(
//             child: Text("$index"),
//           ),
//           title: const Text("Title"),
//           subtitle: const Text("Subtitle"),
//         ),
//       ),
//     );
//   }
// }


class HomeScreen extends StatelessWidget {
  final TextEditingController filter = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Theme.of(context).primaryColor,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
      // height: 120,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.homeAppBarBg),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Column(children: [
          sizedBox65(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(Images.drawerMenuIcon,height: Dimensions.paddingSize30,width: Dimensions.paddingSize30,),
                  sizedBoxW7(),
                  Image.asset(Images.logo,height: Dimensions.paddingSize20,width: Dimensions.paddingSize20,),
                  sizedBoxW7(),
                  Text("GetMyProperties",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize18),),
                ],
              ),
                  Text("Sign Up",style: senBold.copyWith(color: Theme.of(context).cardColor,fontSize: Dimensions.fontSize14),)
            ],),
            ],
           ),
          ),
         ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30.0),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: Container(
                  height: 45,
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.paddingSize5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5)
                    ],
                  ),
                  child: Row(children: [
                    RichText(
                      text:  TextSpan(
                        children: [
                          TextSpan(
                            text: "  Search  ",
                            style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).hintColor), // Different color for "resend"
                          ),
                          TextSpan(
                            text: "City | Locality | Landmark",
                            style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)), // Default text color
                          ),

                        ],
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.search,color: Theme.of(context).hintColor,)
                  ],
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(children: [
              SuitablePropertySection(),
              RecomendedSection(),
              PopularInLocationSectionSection(),
              ServicesSection(),
              NewlyConstructedSection(),
              BrowseMoreSection(
                title: 'Buy A House',
                description: 'Discover your location with the most listings, including exclusive items, and an immersive photo experience.',
                image: Images.buyAHousePlaceHolderImage,),
              BrowseMoreSection(
                title: 'Rent A House',
                description: 'Creating a seamless online rental process: browse top listings, apply, and pay rent easily for a hassle-free experience.',
                image: Images.rentAHousePlaceHolderImage,),
            ],),
          )

        ],
      ),
    );
  }
}