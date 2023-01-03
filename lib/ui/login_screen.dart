import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/otp_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:isekaitec/utils/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  height: 100,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 152, right: 138),
                    child: Image.asset(
                      "assets/media/circular.png",
                      width: 78,
                      height: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/media/welcomeappname.png",
                  width: 193,
                  height: 32,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(Constants.selectaccount_text,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(ColorConstants.buttoncolor),
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      width: 236,
                      child: const Center(
                          child: Text(
                        Constants.caregiver_text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          Utility.createCustomRoute(const Otpscreen()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(ColorConstants.buttoncolor)),
                          color: const Color(ColorConstants.appColor),
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      width: 236,
                      child: const Center(
                          child: Text(
                        Constants.carereceiver_text,
                        style: TextStyle(
                            color: Color(ColorConstants.buttoncolor),
                            fontSize: 24,
                            fontWeight: FontWeight.w400),
                      )),
                    ),
                    onTap: () {
                      Navigator.push(
                          context, Utility.createCustomRoute(Otpscreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/media/welcomescreen_image.png",
              height: 362,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
