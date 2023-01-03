import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:isekaitec/ui/sign_up_screen.dart';
import 'package:isekaitec/ui/success_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:provider/provider.dart';

import '../models/DarkThemeProvider.dart';
import '../utils/utility.dart';

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

  /*Future<User> signInWithGoogle(SignInViewModel model) async {
    model.state =ViewState.Busy;

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =

    await googleSignInAccount!.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(

      accessToken: googleSignInAuthentication.accessToken,

      idToken: googleSignInAuthentication.idToken,

    );

    AuthResult authResult = await _auth.signInWithCredential(credential);

    _user = authResult.user;

    assert(!_user.isAnonymous);

    assert(await _user.getIdToken() != null);

    User currentUser = await _auth.currentUser();

    assert(_user.uid == currentUser.uid);


    model.state =ViewState.Idle;

    print("User Name: ${_user.displayName}");
    print("User Email ${_user.email}");

  }*/

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    // TODO: implement build
    return Scaffold(
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
            image: AssetImage('assets/icons/profile_img.png'),
            width: 100.0,
            height: 100.0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome to Isekai",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Color(ColorConstants.COLOR_BUTTON_GREEN)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Sign in to Continue",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: const TextField(
            decoration: InputDecoration(
              label: Text("Your Email"),
              hintText: "e.g abc@gmail.com",
              prefixIcon: Icon(Icons.email, color: Color(ColorConstants.COLOR_GREY)),
              contentPadding: EdgeInsets.symmetric(vertical: 2.0),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                 color: Color(ColorConstants.COLOR_GREY),
                width: 0.5,
              )),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: const TextField(
            decoration: InputDecoration(
              label: Text("Password"),
              hintText: "*******",
              prefixIcon: Icon(Icons.lock, color: Color(ColorConstants.COLOR_GREY)),
              contentPadding: EdgeInsets.symmetric(vertical: 2.0),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(
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
                  Navigator.pushReplacement(
                      context, Utility.createCustomRoute(const SignUpScreen()));
                },
                style: ElevatedButton.styleFrom(
                    elevation: 12.0,
                    backgroundColor: const Color(ColorConstants.COLOR_BUTTON_GREEN),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 16),
                )),
          ),
        ),
        const Text("OR"),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black12)),
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage('assets/icons/google.png'),
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Login with Google",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )
              ],
            ),
          ),
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
              children: const [
                Image(
                  image: AssetImage('assets/icons/facebook.png'),
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Login with Facebook",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                )
              ],
            ),
          ),
        ),
        TextButton(
          child: const Text("Forgot Passwrod?",
              style: TextStyle(
                  color: Color(ColorConstants.COLOR_BUTTON_GREEN), fontWeight: FontWeight.bold)),
          onPressed: () {},
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have a account?"),
            TextButton(
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Color(ColorConstants.COLOR_BUTTON_GREEN), fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                themeChange.darkTheme = true;
                Navigator.pushReplacement(
                    context, Utility.createCustomRoute(const SuccessScreen()));
              },
            ),
          ],
        ),
          ],
        ),
      ),
    ));
  }
}
