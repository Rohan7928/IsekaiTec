import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/home_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:isekaitec/utils/utility.dart';

class Verifyotpscreen extends StatefulWidget {
  const Verifyotpscreen({Key? key}) : super(key: key);

  @override
  State<Verifyotpscreen> createState() => _VerifyotpscreenState();
}

class _VerifyotpscreenState extends State<Verifyotpscreen> {
  late TextEditingController enterotp_controller;
  @override
  void initState() {
    super.initState();
    enterotp_controller = TextEditingController();
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
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 152,right: 138),
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
                  height: 20,
                ),
                Text(
                  Constants.verificationcode,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.buttoncolor),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    Constants.codesent,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            color: Color(ColorConstants.nametxtcolor),
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        )
                    )
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, Utility.createCustomRoute(HomeScreen()));
                    },
                    child: Image.asset(
                      "assets/media/password.png",
                      height: 175,
                      width: 175,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Constants.enterotp,
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
                        height: 10,
                      ),
                      SizedBox(
                        height: 44,
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: enterotp_controller,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(ColorConstants.textfieldborderColor),width: 1)
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(ColorConstants.textfieldborderColor)))),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
