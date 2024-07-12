import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_search_field.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class SearchScreen extends StatelessWidget {
  final bool? isBackButton;
   SearchScreen({super.key, this.isBackButton = true});



  final List<String> staticCommunityList = [
    'Apartments',
    'Plots',
    'Houses',
    'Flats',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "Search",isBackButtonExist:isBackButton! ?   true: false),
      body: SingleChildScrollView(child:
        Column(children: [
          const Padding(
            padding: EdgeInsets.all( Dimensions.paddingSizeDefault),
            child: SearchField(),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Recent Searches", style: senRegular.copyWith(color: Theme.of(context).primaryColor),),
              IconButton(onPressed: () {}, icon: Icon(Icons.cancel,color: Theme.of(context).primaryColor,))
            ],
          ),

      Wrap(
        spacing: 8.0, // Adjust spacing as needed
        children: staticCommunityList.map((religion) {
          return ChoiceChip(
            selectedColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.white,
            label: Text(
              religion,
              style: TextStyle(
                color: Colors.black.withOpacity(0.80),
              ),
            ),
            selected: false, // Adjust according to your logic
            onSelected: (selected) {
              // Handle selection logic if needed
            },
          );
        }).toList(),),
          // Wrap(
          //   spacing: 8.0, // Adjust spacing as needed
          //   children: authControl.communityList!.map((religion) {
          //     return ChoiceChip(
          //       selectedColor: Theme.of(context).primaryColor,
          //       backgroundColor: Colors.white,
          //
          //       label: Text(religion.name! ,style: TextStyle(color: authControl.communityMainIndex == religion.id ? Colors.white : Colors.black.withOpacity(0.80),),), // Adjust to match your ReligionModel structure
          //       selected: authControl.communityMainIndex == religion.id,
          //       onSelected: (selected) {
          //         if (selected) {
          //           authControl.setCommunityMainListIndex(religion.id, true);
          //         }
          //       },
          //     );
          //   }).toList(),
          // ),


        ],),),

    );
  }
}
