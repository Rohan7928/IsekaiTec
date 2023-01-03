import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:isekaitec/ui/splash_screen.dart';
import 'package:isekaitec/utils/Styles.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'helpers/shared_preference_helper.dart';
import 'models/DarkThemeProvider.dart';
//import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();


}

class _MyApp extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();


  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(

            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: SplashScreen(),
          );
        },
      ),);
  }
}
