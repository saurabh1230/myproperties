import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class NewlyConstructedSection extends StatelessWidget {
  const NewlyConstructedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,vertical:Dimensions.paddingSizeDefault ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Newly Constructed",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
          sizedBox12(),
          SizedBox(
            height: Get.size.height * 0.40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_,i) {
                return Container(
                  width: 307,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 222,width: 307,
                                child: Image.asset("assets/images/newly_constructed_building_image.png"),
                              ),
                              Container(
                                height: 40,
                              ),
                            ],
                          ),
                          Positioned(bottom: 0,left: 0,
                              child: Stack(
                                children: [
                                  Image.asset(Images.ribbonHolder,width: 286,),
                                  Positioned(left: Dimensions.paddingSizeDefault,bottom:Dimensions.paddingSizeDefault,
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Text("Folium By Sumadhura Phase 2",
                                      style: senRegular.copyWith(fontSize: Dimensions.fontSize14),),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Icon(Icons.location_on_sharp,size: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor.withOpacity(0.40),),
                                        Text("Whitefield, Bangalore East",
                                          style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                                      ],),
                                        Text(" ₹ 1.96 - 3.5 Cr | 3, 4 BHK Apartment",
                                          style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                                    ],),
                                  )
                                ],
                              ))

                        ],
                      ),
                      // sizedBox8(),
                      // Text("Natural Aqua Waves",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault,),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      // Text("2,3 BHK Apartment in New Town, Kolkata East",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).disabledColor.withOpacity(0.50)),
                      //   maxLines: 2,overflow: TextOverflow.ellipsis,),
                      // sizedBox8(),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Expanded(child: Text("₹ 1.9 Cr",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).hintColor),)),
                      //     Expanded(
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             border: Border.all(width: 0.5,color: Theme.of(context).primaryColor),
                      //             borderRadius: BorderRadius.circular(Dimensions.paddingSize10)
                      //         ),
                      //         padding: EdgeInsets.all(Dimensions.paddingSize5),
                      //         child: Row(
                      //           children: [
                      //             Text("Check Out",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color:Theme.of(context).primaryColor ),),
                      //             Icon(Icons.arrow_forward,size: Dimensions.fontSize20,color: Theme.of(context).primaryColor,)
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],)
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
          )
        ],),
    );
  }
}
