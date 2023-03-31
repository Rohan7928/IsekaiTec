import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/models/product_category.dart';
import 'package:isekaitec/models/user_model.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api_client.g.dart';

@RestApi(baseUrl: Constants.baseURL)
abstract class RestApiClient {
  factory RestApiClient(Dio dio, {String baseUrl}) = _RestApiClient;

  @GET("ProductViewApi?products=top_20")
  Future<DataResponse<UserModel>> getTop20Items();

  @GET("ProductCategoryApi")
  Future<DataResponse<ProductCategory>> getProductCategoryApi();
}