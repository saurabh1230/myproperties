import 'package:flutter/material.dart';
import 'package:get_my_properties/data/models/response/admin_dashboard_model.dart';
import 'package:get_my_properties/features/screens/home/widgets/custom_container.dart';
import 'package:get_my_properties/features/widgets/custom_shimmer_holders.dart';
import 'package:get_my_properties/utils/date_converter.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';

class InquiryRequestSection extends StatelessWidget {
  final List<LatestInquiries> inquiries;
  final VoidCallback onSeeAll;

  const InquiryRequestSection({
    Key? key,
    required this.inquiries,
    required this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Inquiry Requests",
                style: senRegular.copyWith(
                  fontSize: Dimensions.fontSize14,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              TextButton(
                onPressed: onSeeAll,
                child: Text(
                  "See All",
                  style: senRegular.copyWith(
                    fontSize: Dimensions.fontSize14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: inquiries.length,
            shrinkWrap: true,
            itemBuilder: (_, i) {
              final inquiry = inquiries[i];
              final DateTime createdAtDate = DateConverter.parseDateString(inquiry.createdAt);
              final formattedDate = DateConverter.estimatedOnlyDate(createdAtDate);
              return CustomDecoratedContainer(
                vertical: Dimensions.paddingSize10,
                color: Theme.of(context).primaryColor.withOpacity(0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                inquiry.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: senRegular.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                              Text(
                                "$formattedDate",
                                style: senRegular.copyWith(
                                  fontSize: Dimensions.fontSize12,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),


                        Flexible(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Theme.of(context).primaryColor,
                            size: Dimensions.fontSize18,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${inquiry.email} | ${inquiry.phoneNumber}",
                      style: senRegular.copyWith(
                        fontSize: Dimensions.fontSize12,
                        color: Theme.of(context).disabledColor.withOpacity(0.40),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => sizedBoxDefault(),
          ),
        ],
      ),
    );
  }
}

class Inquiry {
  final String name;
  final String date;
  final String email;
  final String phoneNumber;

  Inquiry({
    required this.name,
    required this.date,
    required this.email,
    required this.phoneNumber,
  });
}


class InquiryRequestShimmer extends StatelessWidget {
  const InquiryRequestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Inquiry Requests",
                style: senRegular.copyWith(
                  fontSize: Dimensions.fontSize14,
                  color: Theme.of(context).disabledColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: senRegular.copyWith(
                    fontSize: Dimensions.fontSize14,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (_, i) {
              return CustomDecoratedContainer(
                vertical: Dimensions.paddingSize20,
                color: Colors.black.withOpacity(0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Flexible(
                          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomShimmerTextHolder(horizontalPadding: 0,),
                              sizedBox10(),
                              CustomShimmerTextHolder(horizontalPadding: 0,),
                            ],
                          ),
                        ),


                        Flexible(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.black.withOpacity(0.1),
                            size: Dimensions.fontSize18,
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => sizedBoxDefault(),
          ),
        ],
      ),
    );
  }
}
