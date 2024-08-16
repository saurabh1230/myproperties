// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
// import 'package:get/get.dart';
// import 'package:get_my_properties/features/widgets/custom_shimmer_holders.dart';
// import 'package:get_my_properties/utils/dimensions.dart';
// import 'package:get_my_properties/utils/sizeboxes.dart';
// import 'package:get_my_properties/utils/styles.dart';
// class HomeScreenShimmer extends StatelessWidget {
//   const HomeScreenShimmer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           sizedBox12(),
//           const CustomShimmerTextHolder(),
//           sizedBox5(),
//           const CustomShimmerTextHolder(horizontalPadding: Dimensions.paddingSize40),
//           // Text("Welcome to GetMyProperties",style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
//           // Text("We will help you find your suitable property",style: senRegular.copyWith(fontSize: Dimensions.fontSize12,
//           //     color: Theme.of(context).disabledColor.withOpacity(0.40)),),
//           sizedBox20(),
//           Center(
//             child: SizedBox(
//               height: Get.size.height * 0.10,
//               child: ListView.separated(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 3,
//                 itemBuilder: (_,i) {
//                   return PrimaryCardContainer(
//                     color: Colors.black.withOpacity(0.1),
//                       width: 100,
//                     onTap: () {
//                     },
//                     child: SizedBox()
//                   );
//                 }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
