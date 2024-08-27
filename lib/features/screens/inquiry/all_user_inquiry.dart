import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/inquiry_controller.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/screens/inquiry/widgets/inquiry_content_component.dart';
import 'package:get_my_properties/features/screens/seller_screens/enquiry/components/enquiry_section_component.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/features/widgets/custom_image_widget.dart';
import 'package:get_my_properties/features/widgets/date_formatter.dart';
import 'package:get_my_properties/features/widgets/empty_data_widget.dart';
import 'package:get_my_properties/utils/app_constants.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/images.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class AllUserInquiry extends StatelessWidget {
  const AllUserInquiry({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<InquiryController>().getUserInquiryList();
    });
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Inquiries',
        isBackButtonExist: true,
      ),
      body: GetBuilder<InquiryController>(builder: (inquiryControl) {
        final list = inquiryControl.userInquiryList;
        final isListEmpty = list == null || list.isEmpty;
        final isLoading = inquiryControl.isLoading;
        return Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: isListEmpty && !isLoading
              ? Padding(
            padding:
            const EdgeInsets.only(top: Dimensions.paddingSize100),
            child: Center(
                child: EmptyDataWidget(
                  image: Images.emptyDataImage,
                  fontColor: Theme.of(context).disabledColor,
                  text: 'No Inquires yet',
                )),
          )
              : isLoading
              ? const Center(child: CircularProgressIndicator())
              :
          Column(
            children: [
              ListView.separated(
                          shrinkWrap: true,
                          itemCount: list!.length,
                          itemBuilder: (_, i) {
                            return InquiryContentComponent(
                                date: list[i].createdAt.toString(),
                                image: list[i].property!.displayImage![0].image.toString(),
                                propertyTitle: list[i].property!.title.toString(),
                                agentName: list[i].vender?.name ?? 'Gmp',
                                message: list[i].message.toString());
                          }, separatorBuilder: (BuildContext context, int index) => sizedBox10(),)
            ],
          ),
        );
      }),
    );
  }
}
