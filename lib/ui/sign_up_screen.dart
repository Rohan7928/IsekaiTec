import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/sign_in_screen.dart';
import '../utils/color_constants.dart';
import '../utils/utility.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  _onWillPop() async{


}


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        return false;
    },
      child: MaterialApp(
          home: SafeArea(
        child: Scaffold(
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
                Text(
                  "Let's Get Started",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(ColorConstants.COLOR_BUTTON_GREEN)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Create an new account",
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                        fontSize: 14, color: Color(ColorConstants.COLOR_GREY)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          fontSize: 14, color: Color(ColorConstants.DARK_BLACK)),
                      label: Text("Full Name",style: GoogleFonts.inter(textStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12))),
                      hintText: "e.g john",
                      prefixIcon: const Icon(Icons.person,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(ColorConstants.LIGHT_GREY),
                        width: 0.5,
                      )),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child:  TextField(
                    decoration: InputDecoration(
                      label: Text("Your Email", style: GoogleFonts.inter(textStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12))),
                      labelStyle: const TextStyle(
                          fontSize: 14, color: Color(ColorConstants.DARK_BLACK)),
                      hintText: "e.g abc@gmail.com",
                      prefixIcon: const Icon(Icons.email,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(ColorConstants.LIGHT_GREY),
                              width: 0.5)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Password", style: GoogleFonts.inter(textStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12))),
                      labelStyle: const TextStyle(
                          fontSize: 14, color: Color(ColorConstants.DARK_BLACK)),
                      hintText: "*******",
                      prefixIcon: const Icon(Icons.lock,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(ColorConstants.LIGHT_GREY),
                              width: 0.5)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Password Again", style: GoogleFonts.inter(textStyle: const TextStyle(fontStyle: FontStyle.normal, fontSize: 12))),
                      labelStyle: const TextStyle(
                          fontSize: 14, color: Color(ColorConstants.DARK_BLACK)),
                      hintText: "*******",
                      prefixIcon: const Icon(Icons.lock,
                          color: Color(ColorConstants.COLOR_GREY)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(ColorConstants.LIGHT_GREY),
                              width: 0.5)),
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: ElevatedButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 12.0,
                            backgroundColor:
                                const Color(ColorConstants.COLOR_BUTTON_GREEN),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "have an account?",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(color: Colors.grey , fontSize: 12)),
                    ),
                    TextButton(
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              color: Color(ColorConstants.COLOR_BUTTON_GREEN),
                              fontWeight: FontWeight.bold , fontSize: 14),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context, Utility.createCustomRoute(const SignInScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      )),
    );
  }
}
