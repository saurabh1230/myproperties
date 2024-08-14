import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class PrefixIconTextHolder extends StatelessWidget {
  final String img;
  final String text;
  final Color ? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  const PrefixIconTextHolder({super.key, required this.img, required this.text, this.backgroundColor, this.iconColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return CustomDecoratedContainer(
      radius: Dimensions.radius5,
      color: backgroundColor ?? Theme.of(context).primaryColor.withOpacity(0.10),
      vertical: Dimensions.paddingSize12,
      horizontal: Dimensions.paddingSize4,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: Dimensions.fontSize14,
              color: iconColor ?? Theme.of(context).primaryColor,
            ),
            sizedBoxW5(),
            Expanded(
              child: Text(
                text,
                style: senRegular.copyWith(
                    fontSize: Dimensions.fontSize12,
                    color: textColor?? Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
