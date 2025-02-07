import 'package:dio/dio.dart';
import '../../../utils/app_constants.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../model/base_model/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  //get popular repository
  Future<ApiResponse> getRepository(var queryParams) async {
    try {
      Response response = await dioClient.get(
        AppConstants.baseUrl+AppConstants.repository,
        queryParameters: queryParams
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }
  }
}