import 'dart:convert';

import 'dart:ffi';

import 'package:isekaitec/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  static late SharedPreferences prefsInstance;
  var prefs;

  static const String USER_ID = "user_id";
  static const String USER_MODEL = "user_model";
  static const String AUTO_LOGIN = "auto_login";
  static const String USER_TOKEN = "user_token";
  static const String FCM_TOKEN  = "fcm_token";
  static const String IS_INTRO_COMPLETED = "is_intro_completed";
  static const THEME_STATUS = "THEMESTATUS";

  static const JsonDecoder decoder = JsonDecoder();
  static const JsonEncoder encoder = JsonEncoder.withIndent('  ');

  static final SharedPreferenceHelper singleton = SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal() {
    prefs ??= SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> init() async {
    prefsInstance = await SharedPreferences.getInstance();
    return prefsInstance;
  }
  setDarkTheme(bool value) async {
    prefsInstance.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    return prefsInstance.getBool(THEME_STATUS) ?? false;
  }
  setAutoLogin(bool value) async{
    prefsInstance.setBool(AUTO_LOGIN, value);
  }

  Future<bool> getAutoLogin() async
  {
    return prefsInstance.getBool(AUTO_LOGIN) ?? false;
  }
  factory SharedPreferenceHelper() {
    return singleton;
  }

  savePref(String key, Object? value) async{
    var prefs = prefsInstance;
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs?.setBool(key, value) ?? Future.value(false);
    } else if (value is int) {
      return prefs?.setInt(key, value);
    } else if (value is String) {
      return prefs?.setString(key, value);
    } else if (value is Double || value is Float) {
      return prefs?.setDouble(key, double.tryParse("$value")!);
    }
  }

  T getPref<T>(String key) {
    return prefsInstance.get(key) as T;
  }

  void clearAll() {
    prefsInstance.clear();
  }

  int getUserId() {
    return getPref(USER_ID);
  }

  void saveUserId(int id) {
    savePref(USER_ID, id);
  }

  String getUserToken() {
    return getPref(USER_TOKEN);
  }

  void saveUserToken(String token) {
    savePref(USER_TOKEN, token);
  }

  bool getIsIntroCompleted() {
    bool value = getPref(IS_INTRO_COMPLETED);
    value ??= false;
    return value;
  }

  void saveIsIntroCompleted(bool value) {
    savePref(IS_INTRO_COMPLETED, value);
  }

  String getFcmToken() {
    return getPref(FCM_TOKEN);
  }

  void saveFcmToken(String token) {
    savePref(FCM_TOKEN, token);
  }

  UserModel? getUserModel() {
    String user = getPref(USER_MODEL);
    if (user != null) {
      Map<String, dynamic> userMap = decoder.convert(getPref(USER_MODEL));
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }

  void saveUserModel(UserModel userModel) {
    if (userModel != null) {
      String value = encoder.convert(userModel);
      savePref(USER_MODEL, value);
    } else {
      savePref(USER_MODEL, null);
    }
  }
}