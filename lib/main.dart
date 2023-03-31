import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isekaitec/ui/splash_screen.dart';
import 'package:isekaitec/utils/authentication.dart';
import 'package:provider/provider.dart';
import 'helpers/shared_preference_helper.dart';
import 'models/DarkThemeProvider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  //await Firebase.initializeApp();
  Authentication.initializeFirebase();


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
            //theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
