import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class CustomNotificationButton extends StatelessWidget {
  final Function() tap;
  final IconData? icon;
  final Color? color;
  const CustomNotificationButton({super.key, required this.tap, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.all(Dimensions.fontSize5),
        decoration:  BoxDecoration(shape: BoxShape.circle,
        color:Theme.of(context).cardColor.withOpacity(0.40)),
        child:  Icon( icon ?? Icons.notifications_outlined,size: Dimensions.fontSize24,color:color?? Theme.of(context).cardColor.withOpacity(0.60),),
      ),
    );
  }
}




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


class CustomOutlineButton extends StatelessWidget {
  final bool? filter;
  final Function() tap;
  final String title;
  final String? filterText;
  const CustomOutlineButton({super.key, this.filter = false, required this.tap, required this.title, this.filterText});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: tap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue, side: const BorderSide(color: Colors.blue, width: 1), // Border color and width
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius5), // Border radius
        ),
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize10, vertical: 8), // Padding
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(filter! ? Icons.tune: Icons.location_on_sharp , size: Dimensions.fontSizeDefault,),
          Text(
            title,
            style: senRegular.copyWith(fontSize: Dimensions.fontSize12),
          ),
          filter ! ? Padding(
            padding: const EdgeInsets.only(left: Dimensions.paddingSize5),
            child: Text(
              filterText!,
              style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color: Theme.of(context).hintColor),
            ),
          ) : const Padding(
            padding: EdgeInsets.only(left: Dimensions.paddingSize5),
            child: Icon(Icons.keyboard_arrow_down_outlined,size:Dimensions.fontSize12 ,),
          )
        ],
      ),
    );
  }
}

class CustomSelectedButton extends StatelessWidget {
  final String title;
  final Function() tap;
  final bool? isSelected;
  const CustomSelectedButton({super.key, required this.tap, this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize25, vertical: Dimensions.paddingSize8),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: isSelected == true
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(0.40)),
          color: Theme.of(context).primaryColor.withOpacity(0.10),
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
        child: Text(
          title,
          style: senRegular.copyWith(fontSize: Dimensions.fontSizeDefault,
          fontWeight: isSelected == true ? FontWeight.w600 : FontWeight.w300,
          color: isSelected == true ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.70)   ),
          // style: TextStyle(
          //   color: isSelected == true
          //       ? Colors.white
          //       : Colors.black,
          // ),
        ),
      ),
    );
  }
}


// class CustomMultipleSelectedButton extends StatelessWidget {
//   final VoidCallback tap;
//   final String title;
//   final bool isSelected;
//
//   CustomMultipleSelectedButton({
//     required this.tap,
//     required this.title,
//     required this.isSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: tap,
//       child: Container(
//         height: 40,
//         width: 80, // Adjust width to fit text
//         decoration: BoxDecoration(
//           color: isSelected ? Theme.of(context).cardColor : Colors.transparent,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(8.0),
//           border: isSelected ? null : Border.all(color: Colors.grey), // Optional: Add border if not selected
//         ),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//               color: isSelected ? Theme.of(context).primaryColor : Colors.black.withOpacity(0.80),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class CustomChipButton extends StatelessWidget {
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onSelect;

  const CustomChipButton({
    Key? key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: index == selectedIndex,
      onSelected: (selected) {
        if (selected) {
          onSelect(index);
        }
      },
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey,
      labelStyle: TextStyle(
        color: index == selectedIndex ? Colors.white : Colors.black,
      ),
      elevation: 3,
      pressElevation: 5,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize25,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}


class PrefixIconButton extends StatelessWidget {
  final Function() tap;
  final String title;
  final bool? prefixIconBool;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? prefixIcon;
  const PrefixIconButton({super.key,
    this.prefixIconBool = false,
    required this.tap,
    required this.title,
    this.backgroundColor, this.textColor, this.prefixIcon,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(Dimensions.paddingSize10),
          border: Border.all(width: 1,color: Theme.of(context).primaryColor)
        ),
        padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize12),
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( prefixIconBool! ?  prefixIcon ?? Icons.call: Icons.chat , size: Dimensions.fontSizeDefault,
            color: textColor?? Theme.of(context).primaryColor,),
            sizedBoxW10(),
            Text(
              title,
              style: senRegular.copyWith(fontSize: Dimensions.fontSize12,color:textColor?? Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
