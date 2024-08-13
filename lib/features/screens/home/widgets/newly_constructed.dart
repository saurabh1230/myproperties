import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/property_controller.dart';
import 'package:get_my_properties/features/widgets/custom_image_widget.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/helper/route_helper.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:get/get.dart';

class NewlyConstructedSection extends StatelessWidget {
  const NewlyConstructedSection({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PropertyController>().getPropertyList(page: '1');
    });
    return Padding(
      padding: const EdgeInsets.only(left:Dimensions.paddingSizeDefault,top:Dimensions.paddingSizeDefault,
        bottom:Dimensions.paddingSizeDefault,),
      child:

      GetBuilder<PropertyController>(builder: (propertyControl) {
        final list = propertyControl.propertyList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = propertyControl.isPropertyLoading;
        return  isListEmpty && !isLoading
            ? Padding(
          padding: const EdgeInsets.only(top: Dimensions.paddingSize100),
          child: Center(
              child: EmptyDataWidget(
                image: Images.emptyDataImage,
                fontColor: Theme.of(context).disabledColor,
                text: 'No Popular Properties yet',
              )),
        ) :
          Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Newly Constructed",style: senBold.copyWith(fontSize: Dimensions.fontSizeDefault),),
            sizedBox12(),
            SizedBox(
              height: Get.size.height * 0.40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: list!.length > 6 ? 6 : list.length,
                itemBuilder: (_,i) {
                  return InkWell(
                    onTap: () => Get.toNamed(RouteHelper.getPropertiesDetailsScreen("Natural Aqua Waves")),
                    child: SizedBox(
                      width: 307,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 222,width: 307,
                                    child: CustomNetworkImageWidget(
                                        radius: Dimensions.radius5,
                                        image: '${AppConstants.imgBaseUrl}${list[i].displayImage!.image.toString()}'),
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
                                            Text(list[i].title.toString(),
                                              style: senRegular.copyWith(fontSize: Dimensions.fontSize14),),
                                            Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.location_on_sharp,size: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor.withOpacity(0.40),),
                                                Text(list[i].description.toString(),
                                                  style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                                              ],),
                                            Text(" ₹ ${list[i].price.toString()} | ${list[i].bedroom.toString()} BHK Apartment",
                                              style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                                          ],),
                                      )
                                    ],
                                  ))

                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimensions.paddingSizeDefault,),),
            )
          ],);
      }),


    );
  }
}
