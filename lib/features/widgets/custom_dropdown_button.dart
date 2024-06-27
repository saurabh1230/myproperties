import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final List<String> itemList;
  final int selectedValue;
  final ValueChanged<int?> onChanged;

  const CustomDropdownWidget({
    Key? key,
    required this.itemList,
    required this.selectedValue,
    required this.onChanged,
    this.title,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) // Check if title is not null
          Text(
            title!,
            style: style ?? TextStyle(fontSize: 16, color: Colors.black), // Default style if not provided
          ),
        sizedBox8(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<int>(
            value: selectedValue,
            items: List.generate(
              itemList.length,
                  (index) {
                return DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    itemList[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
            onChanged: onChanged,
            isExpanded: true,
            underline: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
