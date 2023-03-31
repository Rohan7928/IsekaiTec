import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../connection/presenters/impls/register_user_presenter_impl.dart';
import '../../connection/presenters/register_user_presenter.dart';
import '../../models/product_category.dart';
import '../../models/user_model.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';

class HomeScreenBody extends StatefulWidget {
  int selectedTab = 0;

  HomeScreenBody({super.key});

  @override
  _HomeScreenBody createState() => _HomeScreenBody();
}

class _HomeScreenBody extends State<HomeScreenBody>
    implements RegisterUserContractView {
  late List<UserModel> userList = userList = [];
  late RegisterUserPresenter registerPresenter;
  List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  List<String> countries = [
    "Brazil",
    "Nepal",
    "India",
    "China",
    "USA",
    "Canada"
  ];
  List<String> bottomList = [
    "Nepal",
    "India",
  ];
  int currentPos = 0;
  CarouselController controller = CarouselController();

  @override
  void initState() {
    registerPresenter = RegisterUserPresenterImpl(this);
    initAPI();
  }

  void initAPI() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Utility.showLoader(context);
      registerPresenter.getTop20Items();
      //registerPresenter.getProductCategoryApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Container(
        color: const Color(ColorConstants.whiteColor),
        child: Column(
          children: [
            const Divider(),
            /*   CarouselSlider(
                items: imageList,
                options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPos = index;
                      });
                    }),
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      child: Image.network(imageList[index],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width),
                    ),
                  );
                },
              )*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.map((url) {
                int index = imageList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index
                        ? const Color.fromRGBO(0, 0, 0, 0.9)
                        : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: Text(
                      "Category",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "More Category",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(ColorConstants.COLOR_THEME_GREEN))),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: countries.map((country) {
                    return SizedBox(
                      width: 100.0,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:
                                      const Color(ColorConstants.COLOR_GREY)),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: const Image(
                              image: AssetImage('assets/icons/google.png'),
                              height: 80,
                            ),
                          ),
                          Text(country)
                        ],
                      ),
                    );
                  }).toList(),
                )),
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: Text(
                      "Flash Sale",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "See More",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(ColorConstants.COLOR_THEME_GREEN))),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: userList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 150.0,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      title: Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 120.0,
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, bottom: 8),
                              margin: const EdgeInsets.only(left: 5,bottom: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(bottom: 10, top: 10),
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color(ColorConstants.COLOR_GREY),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Image(
                                    image: AssetImage('assets/icons/google.png'),
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(
                                  height: 08,
                                ),
                                Text(userList[index].product_name!!,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(ColorConstants
                                                .COLOR_THEME_GREEN)))),
                                const SizedBox(
                                  height: 08,
                                ),
                                Text("${userList[index].MRP}",
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(ColorConstants
                                                .COLOR_THEME_GREEN)))),
                                const SizedBox(
                                  height: 08,
                                ),
                              ]),
                            ),
                            /*   Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                    userList[index].product_name!!,
                    style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                    color: Color(ColorConstants.buttoncolor),
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                    ),
                    ),
                    ),
                    ),*/
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            /* Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    child: Text(
                      "Mega Sale",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "See More",
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(ColorConstants.COLOR_THEME_GREEN))),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: countries.map((country) {
                    return Container(
                      width: 120.0,
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      margin: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: const Color(ColorConstants.COLOR_GREY),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Image(
                              image: AssetImage('assets/icons/google.png'),
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 08,
                          ),
                          Text("Refrigerator",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          ColorConstants.COLOR_THEME_GREEN)))),
                          const SizedBox(
                            height: 08,
                          ),
                          Text("\$299,43",
                              overflow: TextOverflow.fade,
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          ColorConstants.COLOR_THEME_GREEN)))),
                          const SizedBox(
                            height: 08,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$534,33",
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color(ColorConstants.COLOR_GREY))),
                              ),
                              const SizedBox(
                                width: 04,
                              ),
                              Text(
                                "24% off",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Color(
                                            ColorConstants.COLOR_LIGHT_RED))),
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  imageList[1],
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bottomList.map((country) {
                return Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: const Color(ColorConstants.COLOR_GREY),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Image(
                          image: AssetImage('assets/icons/google.png'),
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 08,
                      ),
                      Text("Refrigerator",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      ColorConstants.COLOR_THEME_GREEN)))),
                      const SizedBox(
                        height: 08,
                      ),
                      Text("\$299,43",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      ColorConstants.COLOR_THEME_GREEN)))),
                      const SizedBox(
                        height: 08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$534,33",
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(ColorConstants.COLOR_GREY))),
                          ),
                          const SizedBox(
                            width: 04,
                          ),
                          Text(
                            "24% off",
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color:
                                        Color(ColorConstants.COLOR_LIGHT_RED))),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: bottomList.map((country) {
                return Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: const Color(ColorConstants.COLOR_GREY),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Image(
                          image: AssetImage('assets/icons/google.png'),
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        height: 08,
                      ),
                      Text("Refrigerator",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      ColorConstants.COLOR_THEME_GREEN)))),
                      const SizedBox(
                        height: 08,
                      ),
                      Text("\$299,43",
                          overflow: TextOverflow.fade,
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                      ColorConstants.COLOR_THEME_GREEN)))),
                      const SizedBox(
                        height: 08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$534,33",
                            overflow: TextOverflow.fade,
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color(ColorConstants.COLOR_GREY))),
                          ),
                          const SizedBox(
                            width: 04,
                          ),
                          Text(
                            "24% off",
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    color:
                                        Color(ColorConstants.COLOR_LIGHT_RED))),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            )*/
          ],
        ),
      ),
    );
  }

  @override
  void onError(String error) {
    Utility.hideLoader(context);
    log('data: Null $error');
  }

  @override
  void onSuccessRegisterUser(List<UserModel>? userModel) {
    Utility.hideLoader(context);
    //Utility.showSnackbar(context, "Please check your internet connection");
    if (!userModel![0].product_id.isNull) {
      log('data: ${userModel[0].product_id}');
      userList.addAll(userModel);
      setState(() {});
    } else {
      log('data: Null');
    }
  }

  @override
  void onSuccessProductCategory(List<ProductCategory>? productCategory) {}
}
