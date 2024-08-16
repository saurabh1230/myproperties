import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class CustomRadioGroupWidget extends StatelessWidget {
  final List<String> itemList;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomRadioGroupWidget({
    super.key,
    required this.itemList,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        itemList.length,
            (index) {
          final item = itemList[index];
          return RadioListTile<String>(
            activeColor: Theme.of(context).primaryColor,
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              item,
              style: senRegular.copyWith(
                fontSize: Dimensions.fontSize15,
                color: selectedValue == item
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor.withOpacity(0.40),
              ),
            ),
            value: item,
            groupValue: selectedValue,
            onChanged: onChanged,
          );
        },
      ),
    );
  }
}
