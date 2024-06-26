import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key, this.isSelected, this.onTap, required this.buttonText});

  final bool? isSelected;
  final void Function()? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(color: isSelected == true ? Theme.of(context).primaryColor.withOpacity(0.3) : Theme.of(context).disabledColor.withOpacity(0.3)),
        ),
        child:  Center(child: Text(buttonText, style: senRegular.copyWith( fontSize: Dimensions.fontSize10,
            fontWeight: isSelected == true ? FontWeight.w500 : FontWeight.w400,
            color: isSelected == true ? Theme.of(context).primaryColor : Theme.of(context).disabledColor))),
      ),
    );
  }
}
