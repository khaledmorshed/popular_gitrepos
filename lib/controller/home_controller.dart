import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/data/model/remote_model/github_repository_models/github_repository_model.dart';
import 'package:untitled/data/repositories/remote/home_repo.dart';
import 'package:untitled/utils/global/classes/internet_connection_class.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/model/base_model/api_response.dart';
import '../data/repositories/local/sqflite/sqf_lite_db.dart';
import '../data/repositories/local/sqflite/table_info.dart';
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
  List<dynamic> localDataList = [];

  // pagination
  void onScroll() async{
    if(!InternetConnectionClass.isConnected && scrollController.position.pixels == scrollController.position.maxScrollExtent && !paginationIsLoading.value){
     //get all local data at a time without pagination(can perform pagination here also)
      if(localDataList.isEmpty)await getDataFromLocalDatabase();
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
      await getDataFromLocalDatabase();
      return error;
    }
    if (apiResponse.response != null &&  apiResponse.response!.statusCode==200) {
      githubRepositoryModel = GithubRepositoryModel.fromJson(apiResponse.response!.data);
      if(githubRepositoryModel!.items != null){
        githubItems.addAll(githubRepositoryModel!.items!);
        await insertDataInLocalDatabase(githubRepositoryModel!.items!);
      }
    }else{
      customSnackBar(apiResponse.message, backGroundColor: appRedColorSecond);
    }
    isLoading.value = false;
    update();
    return apiResponse.response!.data["status"];
  }

  // store data in local database
  Future<void> insertDataInLocalDatabase(List<GithubItems> githubItemList)async{
    for (GithubItems item in githubItemList) {
      final dataMap = {
        "id": item.id,
        "name": item.name,
        "full_name": item.fullName,
        "login": item.owner!.login,
        "avatar_url": item.owner!.avatarUrl,
        "description": item.description,
        "stargazers_count": item.stargazersCount,
        "watchers_count": item.watchersCount,
        "forks": item.forks,
        "updated_at": item.updatedAt,
      };
      await SqfLitDb.createDatabaseAndInsertDataInTable(tableName: TableInfo.androidRepository, createTableInformation: TableInfo.androidRepositoryTableQuery, map: dataMap);
    }
  }

  // get data from local database and add in list
  Future<void> getDataFromLocalDatabase()async{
    localDataList = await SqfLitDb.getAnyTableDataFromLocalDbWitPassingOnlyTableName(tableName: TableInfo.androidRepository);
    for (var item in localDataList) {
      final ownerObj = Owner(
        login: item["login"],
        avatarUrl: item["avatar_url"],
      );
      final githubItemObj = GithubItems(
        id: item["id"].toString(),
        name: item["name"],
        fullName: item["full_name"],
        owner: ownerObj,
        description: item["description"],
        stargazersCount: item["stargazers_count"],
        watchersCount: item["watchers_count"],
        forks: item["forks"],
        updatedAt: item["updated_at"],
      );
      if (!githubItems.any((existingItem) => existingItem.id == item["id"])) {
        githubItems.add(githubItemObj);
      }
    }
    update();
  }

}