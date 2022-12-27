import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:isekaitec/helpers/shared_preference_helper.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:mime/mime.dart';
import 'package:permission_handler/permission_handler.dart';

class Utility {

  static Future<int> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return 0;
    }
    return 1;
  }

  static Route createCustomRoute(Widget child) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        backgroundColor: const Color(ColorConstants.whiteColor),
      ),
    );
  }

  static void showSnackbarWithAction(BuildContext context, String message, String actionLabel) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: actionLabel,
          textColor: Colors.white,
          onPressed: () {

          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        backgroundColor: const Color(ColorConstants.whiteColor),
      ),
    );
  }

  static hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) => const Dialog(
              backgroundColor: Colors.transparent,
              child: Center(
                child: SpinKitDualRing(
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
        useRootNavigator: false,
        barrierDismissible: false);
  }

  static Future<void> getFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    SharedPreferenceHelper preferenceHelper = SharedPreferenceHelper();
    preferenceHelper.saveFcmToken(fcmToken!);
  }

  static String getFileType(String path){
    final mimeType = lookupMimeType(path);
    String result = mimeType!.substring(0, mimeType.indexOf('/'));
    return result;
  }

  static String generateRandomId() {
    var ran = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(15, (index) => _chars[ran.nextInt(_chars.length)]).join();
  }

  static String getDayOfMonthSuffix(int dayNum) {
    if(!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if(dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch(dayNum % 10) {
      case 1: return 'st';
      case 2: return 'nd';
      case 3: return 'rd';
      default: return 'th';
    }
  }

  // Storage Permission Handler
  static Future<PermissionStatus> requestStoragePermission() async {
    PermissionStatus status = await storagePermissionStatus();

    if (status.isPermanentlyDenied || status.isDenied) {
      await Permission.storage.request();
      return await storagePermissionStatus();
    } else if (await Permission.storage.isRestricted ||
        await Permission.storage.isPermanentlyDenied) {
      await openAppSettings();
      return await storagePermissionStatus();
    } else {
      return await storagePermissionStatus();
    }
  }

  static Future<PermissionStatus> storagePermissionStatus() async {
    return await Permission.storage.status;
  }


  // Camera Permission Handler
  static Future<PermissionStatus> requestCameraPermission() async {
    PermissionStatus status = await cameraPermissionStatus();

    if (status.isPermanentlyDenied || status.isDenied) {
      await Permission.camera.request();
      return await cameraPermissionStatus();
    } else if (await Permission.camera.isRestricted ||
        await Permission.camera.isPermanentlyDenied) {
      await openAppSettings();
      return await cameraPermissionStatus();
    } else {
      return await cameraPermissionStatus();
    }
  }

  static Future<PermissionStatus> cameraPermissionStatus() async {
    return await Permission.camera.status;
  }

  static Future<PermissionStatus> contactPermissionStatus() async {
    return await Permission.contacts.status;
  }


  // Microphone Permission Handler
  static Future<PermissionStatus> requestMicrophonePermission() async {
    PermissionStatus status = await microphonePermissionStatus();

    if (status.isPermanentlyDenied || status.isDenied) {
      await Permission.microphone.request();
      return await microphonePermissionStatus();
    } else if (await Permission.microphone.isRestricted ||
        await Permission.microphone.isPermanentlyDenied) {
      await openAppSettings();
      return await microphonePermissionStatus();
    } else {
      return await microphonePermissionStatus();
    }
  }

  static Future<PermissionStatus> microphonePermissionStatus() async {
    return await Permission.microphone.status;
  }

  // Camera Permission Handler
  static Future<PermissionStatus> requestContactPermission() async {
    PermissionStatus status = await contactPermissionStatus();

    if (status.isPermanentlyDenied || status.isDenied) {
      await Permission.contacts.request();
      return await contactPermissionStatus();
    } else if (await Permission.contacts.isRestricted ||
        await Permission.contacts.isPermanentlyDenied) {
      await openAppSettings();
      return await contactPermissionStatus();
    } else {
      return await contactPermissionStatus();
    }
  }

}
