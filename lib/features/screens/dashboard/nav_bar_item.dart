import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';

class BottomNavItem extends StatelessWidget {
  final String img;
  final Function? tap;
  final bool isSelected;


  const BottomNavItem({super.key, required this.img, this.tap, this.isSelected = false,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:  GestureDetector(
            onTap:tap as void Function()?,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
                child: Image.asset(img,height: 28,width: 28,color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).disabledColor.withOpacity(0.30))))
    );
  }
}
