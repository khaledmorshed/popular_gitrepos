
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../view/features/authentication/login_screen.dart';
import '../../view/features/bottom_nav_bar_screen/bottom_nav_bar_screen.dart';
import '../../view/features/details_screen/details_screen.dart';
import '../../view/features/splash/splash_screen.dart';

class AppRoutes {
  static int duration = 300;
  static final appRoutes = [
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
    GetPage(name: BottomNavBarScreen.routeName, page: () => const BottomNavBarScreen()),
    GetPage(name: DetailsScreen.routeName, page: () => const DetailsScreen()),
  ];
}