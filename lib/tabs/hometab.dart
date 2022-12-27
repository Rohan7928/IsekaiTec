import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/models/catalog.dart';
import 'package:isekaitec/models/itemWidget.dart';
import 'package:isekaitec/models/notificationWidget.dart';
import 'package:isekaitec/models/notificationmodel.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';

class HomeTab extends StatefulWidget {
  @override
  HomeTabState createState() => HomeTabState();
}

class HomeTabState extends State<HomeTab> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(ColorConstants.COLOR_HOME_BACKGROUND),
      body: Column(
        children: [
          const Divider(
            color: Colors.white,
            thickness: 2,
            height: 20,
          ),
          Container(
            color: const Color(ColorConstants.whiteColor),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  Constants.lblcaregiver,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.COLOR_GREEN),
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(item: CatalogModel.items[index]);
              },
              separatorBuilder: (context, index) {
                return Container();
              },
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 2,
            height: 20,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    Constants.lblnotification,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.COLOR_GREEN),
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  Constants.see_all,
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(ColorConstants.COLOR_GREEN),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationThickness: 4,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: NotificationModel.items.length,
              itemBuilder: (context, index) {
                return NotificationWidget(
                    item: NotificationModel.items[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 15.0,
                  thickness: 2.0,
                  color: Color(ColorConstants.whiteColor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
