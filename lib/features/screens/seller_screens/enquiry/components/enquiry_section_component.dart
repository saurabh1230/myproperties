import 'package:flutter/material.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class EnquirySectionComponent extends StatelessWidget {
  final String name;
  final String formattedDate;
  final String email;
  final String phone;
  const EnquirySectionComponent({super.key, required this.name, required this.formattedDate, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return CustomDecoratedContainer(
      vertical: Dimensions.paddingSize10,
      color: Theme.of(context).primaryColor.withOpacity(0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: senRegular.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                    Text(
                      "$formattedDate",
                      style: senRegular.copyWith(
                        fontSize: Dimensions.fontSize12,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),


              Flexible(
                child: Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).primaryColor,
                  size: Dimensions.fontSize18,
                ),
              ),
            ],
          ),
          Text(
            "$email | $phone",
            style: senRegular.copyWith(
              fontSize: Dimensions.fontSize12,
              color: Theme.of(context).disabledColor.withOpacity(0.40),
            ),
          ),
        ],
      ),
    );
  }
}
