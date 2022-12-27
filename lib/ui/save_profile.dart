import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';

class SaveProfileScreen extends StatefulWidget {
  @override
  SaveProfileScreenState createState() => SaveProfileScreenState();
}

class SaveProfileScreenState extends State<SaveProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(ColorConstants.appColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: const Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/icons/profile_img.png'),
                  width: 100.0,
                  height: 100.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                Constants.change_profile,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(ColorConstants.COLOR_GREEN),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: TextField(
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14.0, color: Colors.black87),
                        ),
                        decoration: const InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(ColorConstants.COLOR_GREY)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(ColorConstants.COLOR_GREY)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: TextField(
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              fontSize: 14.0, color: Colors.black87),
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Phone Number",
                          labelText: "Phone Number",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(ColorConstants.COLOR_GREY)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(ColorConstants.COLOR_GREY)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color(ColorConstants.WHITE),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    Constants.save_profile,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.COLOR_GREEN),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    Constants.active_subscription,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.COLOR_GREEN),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Stack(
                children: [
                  Card(
                    elevation: 5.0,
                    color: const Color(ColorConstants.COLOR_PROFILE_CARD_COLOR),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/media/premimum.png",
                                    width: 25.0,
                                    height: 25.0,
                                  ),
                                  Text(
                                    " " + Constants.three_month_plan,
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.nunito(
                                      textStyle: const TextStyle(
                                        color: Color(ColorConstants.WHITE),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/media/activation.png",
                                        width: 10.0,
                                        height: 10.0,
                                      ),
                                      Text(
                                        " " + Constants.activation_text,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                            color: Color(ColorConstants.WHITE),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    left: -90.0,
                    right: 160.0,
                    child: Transform.rotate(
                        angle: -math.pi / 4.0,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 27.0, top: 2.0, bottom: 2.0),
                            color: const Color(ColorConstants.WHITE),
                            child: const Center(child: Text("FREE")))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                Constants.buy_subscription,
                textAlign: TextAlign.right,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(ColorConstants.COLOR_GREEN),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
