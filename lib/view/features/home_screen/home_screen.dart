import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productLandingController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      body: Container(),

    );

  }

}
