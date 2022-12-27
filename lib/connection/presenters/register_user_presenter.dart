import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/models/user_model.dart';

abstract class RegisterUserPresenter {

  void registerUser(UserModel userModel);
}

abstract class RegisterUserContractView {

  void onSuccessRegisterUser(UserModel userModel);

  void onError(String error);
}

abstract class RegisterUserInteractor {

  void registerUser(UserModel userModel, RegisterUserOnCompleteListener callback);
}

abstract class RegisterUserOnCompleteListener {

  void onSuccessRegisterUser(DataResponse response);

  void onError(String error);
}