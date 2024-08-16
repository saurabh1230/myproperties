
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class FilterScreenField extends StatelessWidget {
  final Function() tap;
  final String title;
  final String data;
  const FilterScreenField({
    super.key, required this.tap, required this.title, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: tap,
      child: Column(
          children : [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: senRegular.copyWith(
                      fontSize: Dimensions.fontSize14,
                      color: Theme.of(context).disabledColor.withOpacity(0.99)),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(data,
                          style: senRegular.copyWith(fontSize: Dimensions.fontSize10),),
                    ),
                     Icon(Icons.arrow_forward_ios_rounded,color: Theme.of(context).primaryColor,)
                  ],
                ),
              ],
            ),
            Divider(thickness: 0.5,color: Theme.of(context).primaryColor,),
          ]
      ),
    );
  }
}