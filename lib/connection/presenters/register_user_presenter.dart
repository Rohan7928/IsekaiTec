import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/models/product_category.dart';
import 'package:isekaitec/models/user_model.dart';

abstract class RegisterUserPresenter {
  void getTop20Items();

  void getProductCategoryApi();
}

abstract class RegisterUserContractView {
  void onSuccessRegisterUser(List<UserModel>? userModel);

  void onSuccessProductCategory(List<ProductCategory>? productCategory);

  void onError(String error);
}

abstract class RegisterUserInteractor {
  void registerUser(RegisterUserOnCompleteListener callback);

  void getProductCategoryApi(RegisterUserOnCompleteListener callback);
}

abstract class RegisterUserOnCompleteListener {
  void onSuccessRegisterUser(DataResponse response);

  void onSuccessProductCategory(DataResponse response);

  void onError(String error);
}
