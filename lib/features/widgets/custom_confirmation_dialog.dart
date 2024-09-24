
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_my_properties/controller/auth_controller.dart';
import 'package:get_my_properties/features/widgets/custom_app_button.dart';
import 'package:get_my_properties/utils/styles.dart';
import '../../utils/dimensions.dart';


class ConfirmationDialog extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final String? adminText;
  final Function onYesPressed;
  final Function? onNoPressed;
  final Color? iconColor;
  final bool isLogOut;
  final bool loading;
  const ConfirmationDialog({super.key,
    required this.icon, this.title, required this.description, this.adminText, required this.onYesPressed,
    this.onNoPressed, this.isLogOut = false,  this.iconColor, this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius10)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GetBuilder<AuthController>(builder: (authControl) {
        return  SizedBox(width: 500, child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSize20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSize20),
              child: Image.asset(icon, width: 70, height: 70,
                color: iconColor,),
            ),
            title != null ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize20),
              child: Text(
                title!, textAlign: TextAlign.center,
                style: senMedium.copyWith(fontSize: Dimensions.fontSize20, color: Colors.red),
              ),
            ) : const SizedBox(),

            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSize20),
              child: Text(description, style: senMedium.copyWith(fontSize: Dimensions.fontSize15), textAlign: TextAlign.center),
            ),

            adminText != null && adminText!.isNotEmpty ? Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSize20),
              child: Text('[$adminText]', style: senMedium.copyWith(fontSize: Dimensions.fontSize15), textAlign: TextAlign.center),
            ) : const SizedBox(),
            const SizedBox(height: Dimensions.paddingSize20),
            authControl.deleteProfileLoading ? const Center(child: CircularProgressIndicator()) :
            Row(children: [
              Expanded(child: TextButton(
                onPressed: () => isLogOut ? onYesPressed() : onNoPressed != null ? onNoPressed!() : Get.back(),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent, minimumSize: const Size(1170, 40), padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius10)),
                ),
                child: Text(
                  isLogOut ? 'Yes' : 'No', textAlign: TextAlign.center,
                  style: senBold.copyWith(color: Theme.of(context).cardColor),
                ),
              )),
              const SizedBox(width: Dimensions.paddingSize20),

              Expanded(child: CustomButtonWidget(
                buttonText: isLogOut ? 'No' : 'Yes',
                onPressed: () => isLogOut ? Get.back() : onYesPressed(),
                height: 40,
              )),

            ]),
            /* });
                  }
                  );
                }
                );
              });
            });
          }),*/

          ]),
        ));
      })





    );
  }
}