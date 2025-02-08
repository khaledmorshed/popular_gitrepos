import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/utils/global/screen_padding.dart';
import 'package:untitled/view/features/details_screen/details_screen.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/screen_widgets/home_screen_widgets/home_screen_repository_block_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<HomeController>();

  // api call
  initialize()async{
    controller.isLoading.value = true;
    await controller.getRepository();
  }

  @override
  void initState() {
    controller.scrollController.addListener(controller.onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_){
      initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWidget(
      isAppBar: true,
      appBarTitle: "Github Repository",
      body: Padding(
        padding: screenPadding(),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.isLoading.value ? Center(child: CircularProgressIndicator()) :
            controller.githubItems.isEmpty ? SizedBox(
              height: double.infinity,
              child: Center(child: Text("No Data Found")),
            ) : 
            ListView(
              controller: controller.scrollController,
              children:  [
                ...controller.githubItems.map((item){
                  int index = controller.githubItems.indexOf(item);
                  return  InkWell(
                    onTap: (){
                      Get.to(DetailsScreen(githubItems: item));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12, top: index == 0 ? 12 : 0),
                      child: HomeScreenRepositoryBlockWidget(
                        githubItems: item,
                      ),
                    ),
                  );
                }).toList(),
                if(controller.paginationIsLoading.value) Center(child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CircularProgressIndicator(),
                )),
              ]
            );
          }
        ),
      ),
    );

  }

}
