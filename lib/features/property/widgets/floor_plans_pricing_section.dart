import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class FloorPlansPricingSection extends StatelessWidget {
  const FloorPlansPricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,horizontal:  Dimensions.paddingSizeDefault),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Highlights & Facts",style:  senBold.copyWith(fontSize: Dimensions.fontSizeDefault,),),
          sizedBox10(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (_,i) {
            return PrimaryCardContainer(child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2 BHK BUILDING",style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).primaryColor),),
                          sizedBox10(),
                          Text("1000 sqft",style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).disabledColor),),
                          Text("Build Area",style: senRegular.copyWith(fontSize: Dimensions.fontSize10,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
                          Text("₹ 95 Lac-₹ 1 Cr",style: senRegular.copyWith(fontSize: Dimensions.fontSize13,color: Theme.of(context).disabledColor),),
                          Text("Price Range",style: senRegular.copyWith(fontSize: Dimensions.fontSize10,color: Theme.of(context).disabledColor.withOpacity(0.40)),),

                        ],
                      ),
                    ),
                    sizedBoxW10(),
                    Expanded(
                      child: Container(
                        height: 106,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15)),
                        child: Image.asset("assets/images/floor&prcingImage.png",fit: BoxFit.cover,),
                      ),
                    )
                  ],
                ),
                sizedBoxDefault(),
                CustomButtonWidget(
                  icon: Icons.call,
                  buttonText: "Contact Builder",onPressed: () {},)
              ],
            ));
          }, separatorBuilder: (BuildContext context, int index) =>  sizedBoxDefault(),)

        ],
      ),
    );
  }
}
