import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/sign_up_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';

import '../utils/utility.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage('assets/icons/owl.png'),
                    width: 140.0,
                    height: 150.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Success",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(ColorConstants.DARK_BLUE)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Thank you for shopping using Isakei",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(30,10,30,10),
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
                          "Back To Order",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
