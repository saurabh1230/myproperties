import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/Location_bottom_sheet.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';
class RatingsAndReviewScreen extends StatelessWidget {
   RatingsAndReviewScreen({super.key});

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Ratings & Reviews",isBackButtonExist: true,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical: Dimensions.paddingSizeDefault),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sizedBoxDefault(),
              Align(alignment: Alignment.centerRight,
                  child: IconButton(onPressed: () {
                    Get.bottomSheet(
                       LocationBottomSheet(),
                      backgroundColor: Colors.transparent, isScrollControlled: true,
                    );
                  },
                  icon: Icon(CupertinoIcons.location_fill,size: Dimensions.fontSize24,color: Theme.of(context).primaryColor,))),
              Image.asset(Images.icRatings,height: 40,),
              sizedBoxDefault(),
              Text("Check Ratings & Reviews",style: senBold.copyWith(fontSize: Dimensions.fontSize24),
              textAlign: TextAlign.center,),
              sizedBox5(),
              Text("Check Ratings & Reviews Across Cities & Localities",style: senBold.copyWith(fontSize: Dimensions.fontSize12,
              color: Theme.of(context).disabledColor.withOpacity(0.40)),
                textAlign: TextAlign.center,),
              sizedBox40(),

              sizedBoxDefault(),
              Expanded(
                child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (_,i) {
                  return PrimaryCardContainer(child: Row(
                    children: [
                      Container(
                        decoration : const BoxDecoration(
                      shape: BoxShape.circle,
                       ), clipBehavior: Clip.hardEdge,
                          child: Image.asset("assets/images/hawa_mahal.jpg",height: 40,width: 40,fit: BoxFit.cover,)),
                      sizedBoxW10(),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text("State",style: senMedium.copyWith(fontSize: Dimensions.fontSizeDefault),
                          maxLines: 2,overflow: TextOverflow.ellipsis,),
                
                          Text("State",style: senMedium.copyWith(fontSize: Dimensions.fontSize14,fontWeight: FontWeight.w200,
                          color: Theme.of(context).disabledColor.withOpacity(0.50)),
                            maxLines: 2,overflow: TextOverflow.ellipsis,),
                        ],),
                      ),
                      // Spacer(),
                      //
                      // Expanded(child: Icon(Icons.arrow_forward_ios_sharp))
                    ],
                  ));
                }, separatorBuilder: (BuildContext context, int index) => sizedBoxDefault(),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
