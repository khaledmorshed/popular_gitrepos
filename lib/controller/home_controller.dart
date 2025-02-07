import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/data/model/remote_model/github_repository_models/github_repository_model.dart';
import 'package:untitled/data/repositories/remote/home_repo.dart';
import 'package:untitled/utils/global/classes/internet_connection_class.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/model/base_model/api_response.dart';
import '../data/repositories/remote/login_repo.dart';
import '../utils/global/custom_snack_bar.dart';
import '../utils/global/global_variable.dart';
import '../utils/theme/app_colors/basic_color.dart';

class HomeController extends GetxController {
  DioClient dioClient;
  HomeRepo homeRepo;
  HomeController({required this.dioClient, required this.homeRepo});

  final ScrollController scrollController = ScrollController();
  var currentPage = 1.obs;
  var isLoading = true.obs;
  var paginationIsLoading = false.obs;
  List<GithubItems> githubItems = [];
  GithubRepositoryModel? githubRepositoryModel;

  // pagination
  void onScroll() async{
    if(!InternetConnectionClass.isConnected && scrollController.position.pixels == scrollController.position.maxScrollExtent && !paginationIsLoading.value){
      print("not connected with internet....");
    } else if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !paginationIsLoading.value && canCallApi()) {
      currentPage++;
      paginationIsLoading.value = true;
      update();
      await getRepository();
      paginationIsLoading.value = false;
      update();
    }
  }

  // has access to call api
  canCallApi(){
    if(githubRepositoryModel == null) return true;
    if(githubItems.length < githubRepositoryModel!.totalCount!){
      return true;
    }
    return false;
  }

//get repository
  Future<dynamic> getRepository() async {
    var queryParams = {
      "q": "android",
      "page": currentPage.value,
      "per_page": 20,
    };
    ApiResponse apiResponse = await homeRepo.getRepository(queryParams);
    if(apiResponse.response == null){
      isLoading.value = false;
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
      update();
      return error;
    }
    if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
      githubRepositoryModel = GithubRepositoryModel.fromJson(apiResponse.response!.data);
      if(githubRepositoryModel!.items != null)githubItems.addAll(githubRepositoryModel!.items!);
    }else{
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    }
    isLoading.value = false;
    update();
    //return apiResponse.response!.data["success"];
    return apiResponse.response!.data["status"];
  }

}