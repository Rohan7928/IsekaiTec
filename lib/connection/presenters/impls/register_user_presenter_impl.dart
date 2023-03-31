import 'dart:developer';

import 'package:isekaitec/connection/presenters/impls/register_user_interactor_impl.dart';
import 'package:isekaitec/connection/presenters/register_user_presenter.dart';
import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/models/product_category.dart';
import 'package:isekaitec/models/user_model.dart';

class RegisterUserPresenterImpl
    implements RegisterUserPresenter, RegisterUserOnCompleteListener {

  late RegisterUserContractView contractView;
  late RegisterUserInteractor interactor;

  RegisterUserPresenterImpl(RegisterUserContractView view) {
    contractView = view;
    interactor = RegisterUserInteractorImpl();
  }

  @override
  void onError(String error) {
    contractView.onError(error);
  }

  @override
  void onSuccessRegisterUser(DataResponse response) {
    contractView.onSuccessRegisterUser(response.data?.cast<UserModel>());
  }

  @override
  void getTop20Items() {
    interactor.registerUser(this);
  }

  @override
  void getProductCategoryApi() {
    interactor.getProductCategoryApi(this);
  }

  @override
  void onSuccessProductCategory(DataResponse response) {
    log("Response $response");
    contractView.onSuccessProductCategory(response.data?.cast<ProductCategory>());
  }
}