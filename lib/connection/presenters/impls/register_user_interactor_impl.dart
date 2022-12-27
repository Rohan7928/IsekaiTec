import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:isekaitec/connection/injector.dart';
import 'package:isekaitec/connection/presenters/register_user_presenter.dart';
import 'package:isekaitec/connection/responses/data_response.dart';
import 'package:isekaitec/connection/rest_api_client.dart';
import 'package:isekaitec/models/user_model.dart';

class RegisterUserInteractorImpl implements RegisterUserInteractor {
  late RestApiClient client;

  RegisterUserInteractorImpl() {
    client = Injector().getClient();
  }

  @override
  void registerUser(UserModel userModel, RegisterUserOnCompleteListener callback) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return callback.onError("Please check internet connection");
    }
    client.registerUser(userModel).then((it) {
      DataResponse response = it;
      if (response.status! && response.result != null) {
        callback.onSuccessRegisterUser(response);
      } else if (response.error != null) {
        callback.onError(response.error!);
      } else if (response.message != null) {
        callback.onError(response.message!);
      }
    }).timeout(const Duration(milliseconds: 5000), onTimeout: () {
      callback.onError("Connection timed out");
    }).onError((error, stackTrace) {
      callback.onError(error.toString());
    }).catchError((Object obj) {
      // non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
          callback.onError("${res?.statusMessage}");
          break;
        default:
          callback.onError("Server error");
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
      }
    });
  }
}