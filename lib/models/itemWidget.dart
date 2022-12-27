import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/models/catalog.dart';

import '../utils/color_constants.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(ColorConstants.whiteColor),
      ),
      child: Row(
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
          Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 13.0, right: 13.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(ColorConstants.COLOR_GREEN),
            ),
            child: Text(
              item.price,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(ColorConstants.whiteColor),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
        ],
      ),
    );
  }
}
