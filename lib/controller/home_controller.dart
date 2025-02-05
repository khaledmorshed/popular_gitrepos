import 'package:get/get.dart';
import 'package:untitled/data/repositories/remote/home_repo.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/repositories/remote/login_repo.dart';

class HomeController extends GetxController {
  DioClient dioClient;
  HomeRepo homeRepo;
  HomeController({required this.dioClient, required this.homeRepo});

}