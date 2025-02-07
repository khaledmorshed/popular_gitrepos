import 'package:get/get.dart';
import 'package:untitled/data/model/remote_model/github_repository_models/github_repository_model.dart';
import 'package:untitled/data/repositories/remote/home_repo.dart';
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

  var isLoading = true.obs;
  List<GithubItems> githubItems = [];
  GithubRepositoryModel? _githubRepositoryModel;

//get repository
  Future<dynamic> getRepository() async {
    isLoading.value = true;
    var queryParams = {
      "q": "android",
    };
    ApiResponse apiResponse = await homeRepo.getRepository(queryParams);
    if(apiResponse.response == null){
      isLoading.value = false;
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
      update();
      return error;
    }
    if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
      _githubRepositoryModel = GithubRepositoryModel.fromJson(apiResponse.response!.data);
      if(_githubRepositoryModel!.items != null)githubItems.addAll(_githubRepositoryModel!.items!);
    }else{
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    }
    isLoading.value = false;
    update();
    //return apiResponse.response!.data["success"];
    return apiResponse.response!.data["status"];
  }

}