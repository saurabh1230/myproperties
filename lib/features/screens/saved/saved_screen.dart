import 'package:flutter/material.dart';
import 'package:get_my_properties/features/widgets/custom_app_bar.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Saved",),
    );
  }
}
