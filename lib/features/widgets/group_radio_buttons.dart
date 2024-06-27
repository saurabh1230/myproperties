import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/styles.dart';

class CustomRadioGroupWidget extends StatelessWidget {
  final List<String> itemList;
  final int selectedValue;
  final ValueChanged<int?> onChanged;


  const CustomRadioGroupWidget({
    Key? key,
    required this.itemList,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        itemList.length,
            (index) => RadioListTile<int>(
              activeColor: Theme.of(context).primaryColor,
              dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(itemList[index],style: senRegular.copyWith(fontSize: Dimensions.fontSize15,color: Theme.of(context).disabledColor.withOpacity(0.40)),),
          value: index,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
