import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_rating_text_icon.dart';
import 'package:get_my_properties/features/widgets/custom_see_more_widget.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class RatingAndReviewSection extends StatelessWidget {
  const RatingAndReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Rating & Review",style:  senBold.copyWith(fontSize: Dimensions.fontSizeDefault,),)),
              const RatingTextAndIconWidget(rating: '4.3',),
            ],),
          sizedBox10(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (_,i) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                    child: Image.asset("assets/images/profile_person.png",height: Dimensions.fontSize40,)),
                sizedBoxW10(),
                Expanded(
                  child: Column(   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Anonymous Name",style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor),),
                      Row(
                        children: [
                          Text("A10 March 2024 | ",style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                          RatingTextAndIconWidget(rating: '4.3',iconSize: Dimensions.fontSize12,
                            style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)) ,)
                        ],
                      ),
                      const Divider(),
                      const SeeMoreText(
                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua..',
                      ),


                    ],
                  ),
                )
                
              ],
            );
          }, separatorBuilder: (BuildContext context, int index) => sizedBox10(), )


        ],
      ),
    );
  }
}
