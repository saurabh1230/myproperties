import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';


class PrimaryCardContainer extends StatelessWidget {
  final Widget child;
  final double? padding;
  final Color? color;
  final double? margin;
  final double? width;
  final Function()? onTap;

  const PrimaryCardContainer({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.margin,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // No need to force unwrap with !, as it is optional
      child: Container(
        width: width ?? Get.size.width,
        margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
        padding: EdgeInsets.all(padding ?? Dimensions.paddingSize8),
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              offset: const Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class CustomDecoratedContainer extends StatelessWidget {
  final double? radius;
  final Widget child;
  final Color? color;
  final double? vertical;
  final double? horizontal;
  const CustomDecoratedContainer({super.key,  this.radius, required this.child, this.color, this.vertical, this.horizontal,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical:vertical?? Dimensions.paddingSize5,horizontal:horizontal?? Dimensions.paddingSize10),
      decoration: BoxDecoration(
          color:color ?? Theme.of(context).disabledColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(radius ?? Dimensions.radius10)
      ),
      child: child,
    );
  }
}

