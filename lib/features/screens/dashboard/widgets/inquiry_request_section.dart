import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class InquiryRequestSection extends StatelessWidget {
  const InquiryRequestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Latest Inquiry Requests",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).disabledColor),),
              TextButton(onPressed: () {  },
              child: Text("See All",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).primaryColor),)),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (_,i) {
            return  CustomDecoratedContainer(
              vertical: Dimensions.paddingSize10,

              color: Theme.of(context).primaryColor.withOpacity(0.07),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(child: Text("Vishal Mehra",maxLines: 2,overflow: TextOverflow.ellipsis,
                      style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).disabledColor),)),
                    Text("  01-05-2024",style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).primaryColor),),
                    Spacer(),
                    Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,size: Dimensions.fontSize18,)
                  ],
                ),
                Text("vishalmehra@gmail.com  |  +91 9876543210",style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).disabledColor.withOpacity(0.40)),),

              ],
            ));
          }, separatorBuilder: (BuildContext context, int index) => sizedBoxDefault(),)

        ],
      ),
    );
  }
}
