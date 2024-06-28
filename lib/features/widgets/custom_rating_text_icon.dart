import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class RatingTextAndIconWidget extends StatelessWidget {
  final String rating;
  final TextStyle?  style;
  final double? iconSize;
  const RatingTextAndIconWidget({super.key,required this.rating, this.style, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating,style: style ?? senBold.copyWith(fontSize: Dimensions.fontSize20,color: Theme.of(context).disabledColor),),
        Icon(Icons.star,size: iconSize ?? Dimensions.fontSize20 ,color: Theme.of(context).hintColor,)
      ],
    );
  }
}
