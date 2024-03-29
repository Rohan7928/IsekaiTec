import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:isekaitec/ui/home_screen.dart';
import 'package:isekaitec/ui/sign_up_screen.dart';
import 'package:isekaitec/ui/success_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:provider/provider.dart';

import '../models/DarkThemeProvider.dart';
import '../utils/authentication.dart';
import '../utils/utility.dart';
import 'GoogleSignInButton.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late User _user;
  bool isSignIn = false;
  bool google = false;

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        home: Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/icons/owl.png'),
                    width: 110.0,
                    height: 120.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Welcome to Isekai",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(ColorConstants.COLOR_BUTTON_GREEN)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign in to Continue",
                  style: GoogleFonts.inter(
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.grey)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Your Email",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.normal, fontSize: 12))),
                      hintText: "e.g abc@gmail.com",
                      prefixIcon: const Icon(Icons.email,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(ColorConstants.COLOR_GREY),
                        width: 0.5,
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Password",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontStyle: FontStyle.normal, fontSize: 12))),
                      hintText: "*******",
                      prefixIcon: const Icon(Icons.lock,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(ColorConstants.COLOR_GREY),
                              width: 0.5)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              Utility.createCustomRoute(HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            backgroundColor:
                                const Color(ColorConstants.COLOR_BUTTON_GREEN),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.white)),
                        )),
                  ),
                ),
                Text("OR",
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))),
                FutureBuilder(
                  future: Authentication.initializeFirebase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return const GoogleSignInButton();
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.orange,
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Utility.createCustomRoute(const SuccessScreen());
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage('assets/icons/facebook.png'),
                          height: 25,
                          width: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Login with Facebook",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  child: Text("Forgot Passwrod?",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Color(ColorConstants.COLOR_BUTTON_GREEN),
                              fontWeight: FontWeight.bold,
                              fontSize: 12))),
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have a account?",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.normal, fontSize: 12))),
                    TextButton(
                      child: Text(
                        "Register",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: Color(ColorConstants.COLOR_BUTTON_GREEN),
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                      onPressed: () {
                        themeChange.darkTheme = true;
                        Navigator.pushReplacement(context,
                            Utility.createCustomRoute(const SuccessScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
