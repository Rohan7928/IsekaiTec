import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:isekaitec/ui/sign_in_screen.dart';
import 'package:isekaitec/ui/splash_screen.dart';
import '../utils/color_constants.dart';
import '../utils/utility.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late User _user;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            body:   SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
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
                      "Let's Get Started",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Color(ColorConstants.COLOR_BUTTON_GREEN)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create an new account",
                      style: TextStyle(fontSize: 14, color: Color(ColorConstants.COLOR_GREY)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color(ColorConstants.DARK_BLACK)
                          ),
                          label: Text("Full Name"),
                          hintText: "e.g john",
                          prefixIcon: Icon(Icons.person, color: Color(ColorConstants.COLOR_GREY)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(ColorConstants.LIGHT_GREY),
                                width: 0.5,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          label: Text("Your Email"),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color(ColorConstants.DARK_BLACK)
                          ),
                          hintText: "e.g abc@gmail.com",
                          prefixIcon: Icon(Icons.email, color: Color(ColorConstants.COLOR_GREY)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(ColorConstants.LIGHT_GREY), width: 0.5)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          label: Text("Password"),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color(ColorConstants.DARK_BLACK)
                          ),
                          hintText: "*******",
                          prefixIcon: Icon(Icons.lock, color: Color(ColorConstants.COLOR_GREY)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(ColorConstants.LIGHT_GREY), width: 0.5)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: const TextField(
                        decoration: InputDecoration(
                          label: Text("Password Again"),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Color(ColorConstants.DARK_BLACK)
                          ),
                          hintText: "*******",
                          prefixIcon: Icon(Icons.lock, color: Color(ColorConstants.COLOR_GREY)),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 2.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(ColorConstants.LIGHT_GREY), width: 0.5)),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(30,10,30,10),
                      child: ElevatedButton(
                          onPressed: () {
                            //forgot password screen
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("have a account?",style: TextStyle(
                            color: Colors.grey
                        ),),
                        TextButton(
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color:  Color(ColorConstants.COLOR_BUTTON_GREEN),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context, Utility.createCustomRoute(SignInScreen()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          )


    );
  }
}
