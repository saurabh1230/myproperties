
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/styles.dart';


import '../../utils/dimensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final Widget? menuWidget;

  const CustomAppBar({Key? key, required this.title, this.onBackPressed, this.isBackButtonExist = false, this.menuWidget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title!, style: senRegular.copyWith(fontSize: Dimensions.fontSize18, color: Theme.of(context).cardColor)),
      centerTitle: true,
      leading: isBackButtonExist ? IconButton(
        icon:  const Icon(Icons.arrow_back),
        color: Theme.of(context).textTheme.bodyLarge!.color,
        onPressed: () =>  Navigator.pop(context),
      ) :  Builder(
        builder: (context) => InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            padding:  const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: Image.asset(Images.drawerMenuIcon,height: 24,width: 24,),
          ),
        ),),

      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      actions: menuWidget != null ? [menuWidget!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
