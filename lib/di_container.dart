import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/controller/home_controller.dart';
import 'package:untitled/controller/login_controller.dart';
import 'package:untitled/data/repositories/remote/home_repo.dart';
import 'package:untitled/utils/app_constants.dart';
import 'controller/splash_controller.dart';
import 'controller/theme_controller.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/remote/login_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// Core
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  sl.registerLazySingleton(() => LoginRepo(dioClient: sl()));
  sl.registerLazySingleton(() => HomeRepo(dioClient: sl()));

/// Controller
  Get.lazyPut(() => ThemeController(), fenix: true);
  Get.lazyPut(() => SplashController(dioClient: sl()), fenix: true);
  Get.lazyPut(() => LoginController(dioClient: sl(), loginRepo: sl()), fenix: true);
  Get.lazyPut(() => HomeController(dioClient: sl(), homeRepo: sl()), fenix: true);

/// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());

}