import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';

class CallHistoryScreen extends StatefulWidget {
  @override
  CallHistoryScreenState createState() => CallHistoryScreenState();
}

class CallHistoryScreenState extends State<CallHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ColorConstants.appColor),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: null,
          title: Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.last_active_history,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.COLOR_GREEN),
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Text(
                  Constants.see_all,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(ColorConstants.DARK_BLACK),
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.separated(
          // Let the ListView know how many items it needs to build.
          itemCount: 10,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Color(ColorConstants.WHITE),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: const Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/media/friends.png'),
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      Text(
                        "Anne Copper Sis",
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(ColorConstants.DARK_BLACK),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(ColorConstants.COLOR_GREEN),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          Constants.send_message,
                          style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                              color: Color(ColorConstants.WHITE),
                              fontWeight: FontWeight.w700,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color(ColorConstants.COLOR_RED),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Constants.last_Call,
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Color(ColorConstants.WHITE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Text(
                              "18h",
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Color(ColorConstants.WHITE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Constants.time_duration,
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Color(ColorConstants.WHITE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            Text(
                              "17h",
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Color(ColorConstants.WHITE),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 14,
            color: Color(ColorConstants.WHITE),
            thickness: 2,
          ),
        ));
  }
}
