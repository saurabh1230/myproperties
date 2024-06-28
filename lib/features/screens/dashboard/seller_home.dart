import 'package:flutter/material.dart';
import 'package:get_my_properties/controller/home_controller.dart';
import 'package:get_my_properties/features/screens/dashboard/widgets/inquiry_request_section.dart';

import 'package:get_my_properties/features/widgets/custom_app_bar.dart';
import 'package:get_my_properties/features/widgets/custom_buttons.dart';
import 'package:get_my_properties/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/utils/sizeboxes.dart';
import 'package:get_my_properties/utils/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class SellerHome extends StatelessWidget {
  const SellerHome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "Dashboard",menuWidget: CustomNotificationButton(
        tap: () {},
      ),),
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 350,
                child: GridView.builder(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: Dimensions.paddingSizeDefault, // Horizontal spacing between columns
                    mainAxisSpacing: Dimensions.paddingSizeDefault, // Vertical spacing between rows
                    childAspectRatio: 1.8, // Aspect ratio of each item
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.sellerDashboardCount.length,
                  itemBuilder: (_, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: controller.sellerDashboardColors[i],
                          borderRadius: BorderRadius.circular(Dimensions.radius10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.sellerDashboardCount[i],
                            style: senBold.copyWith(
                              fontSize: Dimensions.fontSize30,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            controller.sellerDashboardOverView[i],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: senRegular.copyWith(
                              fontSize: Dimensions.fontSize12,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Inquiry Request",style: senRegular.copyWith(fontSize: Dimensions.fontSize14,color: Theme.of(context).disabledColor),),

                      ],
                    ),

                    SizedBox(
                      height: 200,
                      child: SfCartesianChart(
                        // Initialize category axis
                          primaryXAxis: CategoryAxis(),
                          series: <CartesianSeries>[
                            // Initialize line series
                            LineSeries<ChartData, String>(
                                dataSource: [
                                  // Bind data source
                                  ChartData('Jan', 35),
                                  ChartData('Feb', 28),
                                  ChartData('Mar', 34),
                                  ChartData('Apr', 32),
                                  ChartData('May', 40)
                                ],
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              sizedBox10(),

              const InquiryRequestSection(),
              sizedBox40(),



            ],
          ),
        );
      }),

    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}