import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class CheckoutArrowButton extends StatelessWidget {
  final Function() tap;
  const CheckoutArrowButton({super.key, required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5,color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(Dimensions.paddingSize10)
        ),
        padding: const EdgeInsets.all(Dimensions.paddingSize5),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Check Out",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color:Theme.of(context).primaryColor ),),
            Icon(Icons.arrow_forward,size: Dimensions.fontSize20,color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
    );
  }
}
