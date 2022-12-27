import 'package:isekaitec/connection/presenters/impls/register_user_interactor_impl.dart';
import 'package:isekaitec/connection/presenters/register_user_presenter.dart';
import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/models/user_model.dart';

class RegisterUserPresenterImpl implements RegisterUserPresenter, RegisterUserOnCompleteListener {

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
    contractView.onSuccessRegisterUser(response.result);
  }

  @override
  void registerUser(UserModel userModel) {
    interactor.registerUser(userModel, this);
  }
}