import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class ExploreCardWidget extends StatelessWidget {
  final int itemCount;
  final String image;
  final String ratingText;
  final String imagesLength;
  final Function() likeTap;
  final Function() detailsTap;
  final String propertyCategory;
  final String title;
  final String description;
  final String price;
  final PageController pageController;

  const ExploreCardWidget({super.key, required this.itemCount, required this.image, required this.ratingText, required this.imagesLength, required this.likeTap, required this.detailsTap, required this.propertyCategory, required this.title, required this.description, required this.price, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200]!,
            offset: const Offset(0, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSize8),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: pageController,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(image,fit: BoxFit.cover,),
                      );
                    },
                  ),

                  Align(alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimensions.paddingSize10),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomDecoratedContainer(
                              child: Row(children: [
                                Text(ratingText,style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).hintColor),),
                                Icon(Icons.star,color: Theme.of(context).hintColor,size: Dimensions.fontSize15,)
                              ],)),
                          CustomNotificationButton(
                              color:Theme.of(context).disabledColor.withOpacity(0.15),
                              tap: likeTap,
                              icon:CupertinoIcons.heart
                          ),

                        ],
                      ),
                    ),
                  ),
                  Positioned(bottom: 10,right: 10,
                      child: CustomDecoratedContainer(
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt_outlined,color: Theme.of(context).cardColor,size: Dimensions.fontSizeDefault,),
                            Text(imagesLength,style: senRegular.copyWith(color: Theme.of(context).cardColor),)
                          ],
                        ),
                      ))

                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     margin: const EdgeInsets.only(bottom: 8),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: List.generate(
                  //         _imageUrls.length,
                  //             (index) => Container(
                  //           width: 8,
                  //           height: 8,
                  //           margin: const EdgeInsets.symmetric(horizontal: 4),
                  //           decoration: BoxDecoration(
                  //             shape: BoxShape.circle,
                  //             color: _currentPage == index ? Colors.blue : Colors.grey,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSize10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.appartmentImage,
                        height: Dimensions.fontSize24,
                        width: Dimensions.fontSize24,
                      ),
                      Text(
                        propertyCategory,
                        style: senRegular.copyWith(
                          fontSize: Dimensions.fontSize13,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  sizedBox8(),
                  Text(
                    title,
                    style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  sizedBox8(),
                  Text(
                    description,
                    style: senRegular.copyWith(
                      fontSize: Dimensions.fontSize12,
                      color: Theme.of(context).disabledColor.withOpacity(0.40),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    price,
                    style: senBold.copyWith(
                      fontSize: Dimensions.fontSize20,
                      color: Theme.of(context).hintColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  CustomButtonWidget(
                    radius: Dimensions.radius5,
                    fontSize: Dimensions.fontSize14,
                    height: 32,
                    buttonText: "View Details",
                    isBold: false,
                    onPressed: detailsTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
