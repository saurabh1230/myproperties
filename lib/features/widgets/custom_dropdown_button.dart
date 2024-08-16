import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

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



class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String hintText;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;

  const CustomDropdownButtonFormField({
    Key? key,
    required this.value,
    required this.items,
    required this.hintText,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      borderRadius: BorderRadius.circular(Dimensions.radius15),
      value: value,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius5),
          borderSide: BorderSide(
            style: BorderStyle.solid ,
            width: 0.3,
            color: Theme.of(context).primaryColorDark.withOpacity(0.80),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius5),
          borderSide: BorderSide(
            style: BorderStyle.solid ,
            width: 1,
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius5),
          borderSide: BorderSide(
            style:  BorderStyle.solid,
            width: 0.3,
            color: Theme.of(context).primaryColorDark.withOpacity(0.80),
          ),
        ),
      ),
      hint: Text(hintText,style: senRegular.copyWith(
        fontSize: Dimensions.fontSizeDefault,
        color: Theme.of(context).hintColor,
      ),),
      validator: validator,
    );
  }
}
