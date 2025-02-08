import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/theme_controller.dart';
import '../../../utils/global/size_box.dart';
import '../../../utils/style/app_style.dart';
import '../../../utils/theme/get_all_theme.dart';
import '../../widgets/custom_widgets/custom_container_widget.dart';
import '../../widgets/custom_widgets/custom_horizontal_divider.dart';
import '../../widgets/custom_widgets/custom_icon_widget.dart';
import '../../widgets/custom_widgets/custom_scaffold_widget.dart';
import '../../widgets/custom_widgets/theme_button_widget.dart';


class SettingsScreen extends StatefulWidget {
  static const String routeName = "/SettingsScreen";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {

    return CustomScaffoldWidget(
      isAppBar: true,
      appBarTitle: "Settings",
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              szH15(),
              CustomContainerWidget(
                themeIndex: 2,
                padding: 12,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onPrimary
                      ),
                      child: ClipRRect(
                        // borderRadius: BorderRadius.circular(26),
                        //backgroundImage: profileProvider.userProfileModel!.results!.photo != null ? Image.network(profileProvider.userProfileModel!.results!.photo!.filePath.toString()).image : null,
                        //child: profileProvider.userProfileModel!.results!.photo == null ? txt25(firstLetter, fontWeight: FontWeight.w500) : null,
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/flutter.png", scale: 1, fit: BoxFit.cover,),
                        )  /*Image.network(profileProvider.userProfileModel!.results!.photo!.filePath.toString()).image*/ ,
                        // child: profileProvider.userProfileModel!.results!.photo != null ? txt25(firstLetter, fontWeight: FontWeight.w500) : Image.asset("assets/logo/fore_ground/fore_ground_icon.png", height: 30, width: 30,) ,
                      ),
                    ),
                    szW15(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("S.M. Khaled Morshed", style: myTxt15(color: GetTheme().txtTheme().txtColorBlack!),),
                        szH6(),
                        Text("01749794586", style: myTxt13(color: GetTheme().txtTheme().txtLabelColorMedium!)),
                        // szH6(),
                        // Text("data"),
                      ],
                    )
                  ],
                ),
              ),
              szH10(),
              CustomContainerWidget(
                themeIndex: 2,
                padding: 12,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SETTINGS", style: myTxt12(color: GetTheme().txtTheme().txtLabelColorMedium!)),
                    szH15(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomIconWidget(
                              themeIndex: 1,
                              child: Icons.format_color_text_sharp,
                              size: 23,
                            ),
                            szW20(),
                            Text("Theme", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                          ],
                        ),
                        GetBuilder<ThemeController>(
                          builder: (themController) {
                            return SwitchAdaptiveWidget(
                              value: themController.isDarkMode,
                              onChange: (value)async{
                                await themController.toggleTheme(value);
                                setState(() {
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    szH15(),
                    CustomHorizontalDivider(
                      width: MediaQuery.of(context).size.width,
                      height: 0.3,
                    ),
                    szH15(),
                    Row(
                      children: [
                        CustomIconWidget(
                          themeIndex: 1,
                          child: Icons.perm_device_info_sharp,
                          size: 23,
                        ),
                        szW20(),
                        Text("Permission", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                      ],
                    ),
                  ],
                ),
              ),
              szH10(),
              CustomContainerWidget(
                themeIndex: 2,
                padding: 12,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HELP & LEGAL", style: myTxt12(color: GetTheme().txtTheme().txtLabelColorMedium!)),
                    szH15(),
                    Row(
                      children: [
                        CustomIconWidget(
                          themeIndex: 1,
                          child: Icons.support,
                          size: 23,
                        ),
                        szW20(),
                        Text("Emergency Support", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                      ],
                    ),
                    szH15(),
                    CustomHorizontalDivider(
                      width: MediaQuery.of(context).size.width,
                      height: 0.3,
                    ),
                    szH15(),
                    Row(
                      children: [
                        CustomIconWidget(
                          themeIndex: 1,
                          child: Icons.help,
                          size: 23,
                        ),
                        szW20(),
                        Text("Help", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                      ],
                    ),
                    szH15(),
                    CustomHorizontalDivider(
                      width: MediaQuery.of(context).size.width,
                      height: 0.3,
                    ),
                    szH15(),
                    Row(
                      children: [
                        CustomIconWidget(
                          themeIndex: 1,
                          child: Icons.policy,
                          size: 23,
                        ),
                        szW20(),
                        Text("Policy", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                      ],
                    ),
                  ],
                ),
              ),
              szH10(),
              CustomContainerWidget(
                themeIndex: 2,
                padding: 12,
                child:  Row(
                  children: [
                    CustomIconWidget(
                      themeIndex: 1,
                      child: Icons.exit_to_app,
                      size: 23,
                    ),
                    szW20(),
                    Text("Log out", style: myTxt14(color: GetTheme().txtTheme().txtColorBlack!)),
                  ],
                ),
              ),
              szH10(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/png/google.png", height: 30, width: 36,),
                      szW15(),
                      Image.asset("assets/png/facebook.png", height: 28, width: 34,)
                    ],
                  ),
                  szH15(),
                  Text("Version 1.0.0+1", style: myTxt14(color: GetTheme().txtTheme().txtLabelColorMedium!)),
                ],
              ),
              szH15(),
            ],
          ),
        ),
      ),
    );
  }
}
