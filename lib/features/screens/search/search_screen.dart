import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class SearchScreen extends StatelessWidget {
  final bool? isBackButton;
  const SearchScreen({super.key, this.isBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "Search",isBackButtonExist:isBackButton! ?   true: false),
      body: SingleChildScrollView(child:
        Column(children: [
          Padding(
            padding: const EdgeInsets.all( Dimensions.paddingSizeDefault),
            child: SearchField(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Recent Searches", style: senRegular.copyWith(color: Theme.of(context).primaryColor),),
              IconButton(onPressed: () {}, icon: Icon(Icons.close,color: Theme.of(context).primaryColor,))
            ],
          ),
          sizedBoxDefault(),


        ],),),

    );
  }
}
