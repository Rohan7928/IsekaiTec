import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/models/catalog.dart';
import 'package:isekaitec/models/itemWidget.dart';
import 'package:isekaitec/models/notificationmodel.dart';
import 'package:isekaitec/utils/constants.dart';

import '../utils/color_constants.dart';

class NotificationWidget extends StatelessWidget {
  final Item1 item;

  const NotificationWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(ColorConstants.whiteColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              Image.asset(
                item.image,
                height: 90,
                width: 55,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Text(
                  item.name,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.COLOR_HOME),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                item.time,
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color(ColorConstants.COLOR_HOME),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Text(
                  Constants.fine,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.COLOR_HOME),
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 12.0, right: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: const Color(ColorConstants.COLOR_GREEN),
                ),
                child: Text(
                  Constants.lblAppName,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.whiteColor),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Container(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: const Color(ColorConstants.COLOR_RED),
                ),
                child: Text(
                  Constants.bad,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.whiteColor),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
