import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_my_properties/utils/dimensions.dart';

class PrimaryCardContainer extends StatelessWidget {
  final Widget child;
  final double? padding;
  final Color? color;
  const PrimaryCardContainer({super.key, required this.child,  this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding?? Dimensions.paddingSize8),
      decoration: BoxDecoration(
          color:color ?? Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          boxShadow: [BoxShadow(color: Colors.grey[200]!, offset: const Offset(0, 5), blurRadius: 10)]
      ),
      child: child,
    );
  }
}
