import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/verification_otp_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:isekaitec/utils/utility.dart';

import 'home_screen.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({Key? key}) : super(key: key);

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  late TextEditingController nameController, phoneNoController;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneNoController = TextEditingController();
  }

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "rohan7928@gmail.com", password: "12345678");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(ColorConstants.appColor),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/media/app_logo.png",
                  width: 125,
                  height: 25,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Constants.fill_information,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(Constants.carereceiver_acc_text,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.COLOR_PRIMARY),
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    "assets/media/friends.png",
                    height: 180,
                    width: 180,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.emailTxt,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(ColorConstants.nametxtcolor),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 44,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          ColorConstants.textfieldborderColor),
                                      width: 1)),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(ColorConstants
                                          .textfieldborderColor)))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Constants.passwordTxt,
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(ColorConstants.nametxtcolor),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 44,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: phoneNoController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(
                                          ColorConstants.textfieldborderColor),
                                      width: 1)),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(ColorConstants
                                          .textfieldborderColor)))),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, bottom: 55),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(ColorConstants.COLOR_PRIMARY),
                      borderRadius: BorderRadius.circular(10)),
                  height: 45,
                  width: 202,
                  child: Center(
                      child: Text(
                    Constants.login_btn_txt,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  )),
                ),
                onTap: () {
                  signUp();
                  //Navigator.push(context, Utility.createCustomRoute(HomeScreen()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
