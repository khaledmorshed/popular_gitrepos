import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/utils/app_constants.dart';
import 'package:untitled/utils/global/classes/internet_connection_class.dart';
import 'package:untitled/utils/routes/app_routes.dart';
import 'package:untitled/utils/services/global_navigation_service/navigation_service_widget.dart';
import 'package:untitled/utils/theme/app_theme.dart';
import 'package:untitled/view/features/authentication/login_screen.dart';
import 'package:untitled/view/features/splash/splash_screen.dart';
import 'controller/theme_controller.dart';
import 'di_container.dart' as di;


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //for internet connect set up for global responding
  initializeInternet(context)async{
    InternetConnectionClass.startStreaming(context);
  }
  @override
  Widget build(BuildContext context) {
    initializeInternet(context);
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: ((context, child) {
            return GetMaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              themeMode: controller.themeMode,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              initialRoute: SplashScreen.routeName,
              getPages: AppRoutes.appRoutes,
              navigatorKey: GlobalNavigationService.navigatorKey,
            );
          }),
        );
      }
    );
  }
}