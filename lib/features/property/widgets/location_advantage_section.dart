import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class LocationAdvantageSection extends StatelessWidget {
  const LocationAdvantageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault,horizontal:  Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Text("Location Advantage",style:  senBold.copyWith(fontSize: Dimensions.fontSizeDefault,),),
          sizedBox10(),
          Image.asset("assets/images/map_holder.png",),
          sizedBoxDefault(),
          buildRow(context,'2 min from hospital'),
          buildRow(context,'1 min from daily needs'),
          buildRow(context,'5 min away from metro station'),

        ],
      ),
    );
  }

  Padding buildRow(BuildContext context,String title) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingSize4),
      child: Row(
            children: [
              Icon(Icons.check_circle_rounded,size: Dimensions.fontSize20,color: Theme.of(context).primaryColor,),
              sizedBoxW5(),
              Expanded(child: Text(title,style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.50)),
              maxLines: 2,overflow: TextOverflow.ellipsis,))
            ],
          ),
    );
  }
}
