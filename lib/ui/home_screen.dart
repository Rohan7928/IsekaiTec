import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/models/drawer_items_model.dart';
import 'package:isekaitec/tabs/hometab.dart';
import 'package:isekaitec/ui/contact_screen.dart';
import 'package:isekaitec/ui/splash_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:isekaitec/utils/constants.dart';
import 'package:isekaitec/utils/utility.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/utility.dart';

class HomeScreen extends StatefulWidget {
  int selectedTab = 0;

  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int tabIndex = 0, userId = 0;
  bool animation = false;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();
  late List<DrawerItemModel> menuList;

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    if (widget.selectedTab != null && widget.selectedTab != 0) {
      tabIndex = widget.selectedTab;
    }
    pageController = PageController(initialPage: tabIndex);
    initPackageInfo();
    menuList = [];
    menuList.add(DrawerItemModel(0, "Home"));
    menuList.add(DrawerItemModel(1, "My Profile"));
    menuList.add(DrawerItemModel(2, "My Contact List"));
    menuList.add(DrawerItemModel(3, "Help & Support"));
    menuList.add(DrawerItemModel(4, "Subscription Plans"));
    menuList.add(DrawerItemModel(5, "Switch Account"));
    menuList.add(DrawerItemModel(6, "Logout"));
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  void navigateToPage(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: _scaffoldState,
          backgroundColor: const Color(ColorConstants.COLOR_HOME_BACKGROUND),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(ColorConstants.COLOR_HOME_BACKGROUND),
            automaticallyImplyLeading: false,
            // Don't show the leading button

            title: Text(
              Constants.lblHome,
              style: GoogleFonts.nunito(
                textStyle: const TextStyle(
                  color: Color(ColorConstants.COLOR_HOME),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),
            actions: [
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/icons/notification_icon.png",
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                  Positioned(
                    right: 1.0,
                    top: 18.0,
                    child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(ColorConstants.COLOR_GREEN)),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(13),
                  child: GestureDetector(
                    onTap: () {
                      _scaffoldState.currentState?.openEndDrawer();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      //make border radius more than 50% of square height & width
                      child: Image.asset(
                        "assets/icons/profile_img.png",
                        height: 22.0,
                        width: 32.0,
                        fit: BoxFit.cover, //change image fill type
                      ),
                    ),
                  )),
              Container(
                child: GestureDetector(
                  onTap: () {
                    _scaffoldState.currentState?.openEndDrawer();
                  },
                  child: Image.asset(
                    "assets/icons/dropdown_icon.png",
                    height: 7.0,
                    width: 11.0,
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              )
            ],
          ),
          endDrawer: Container(
            width: 220,
            child: Drawer(
              backgroundColor: const Color(ColorConstants.COLOR_PRIMARY),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Container(
                  color: const Color(ColorConstants.COLOR_PRIMARY),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150.0,
                            child: DrawerHeader(
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(200.0),
                                              child: Image.asset(
                                                "assets/icons/profile_img.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: SizedBox(
                                            width: 11.0,
                                            height: 7.0,
                                            child: ClipRRect(
                                                child: Image.asset(
                                              "assets/icons/upwards_arrow.png",
                                              height: 7.0,
                                              width: 11.0,
                                            )),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: menuList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      // _scaffoldState.currentState.closeDrawer();
                                      Navigator.pop(context);
                                      Future.delayed(
                                          const Duration(milliseconds: 120));
                                      if (menuList[index].id == 0) {
                                        setState(() {
                                          tabIndex = 0;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 1) {
                                        setState(() {
                                          tabIndex = 1;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 2) {
                                        setState(() {
                                          tabIndex = 2;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 3) {
                                        setState(() {
                                          tabIndex = 3;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 4) {
                                        setState(() {
                                          tabIndex = 4;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 5) {
                                        setState(() {
                                          tabIndex = 5;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 6) {
                                        setState(() {
                                          tabIndex = 6;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 7) {
                                        setState(() {
                                          tabIndex = 7;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 8) {
                                        setState(() {
                                          tabIndex = 8;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 9) {
                                        // Navigator.push(context, Utility.createCustomRoute(HelpAndSupportScreen()));
                                        setState(() {
                                          tabIndex = 9;
                                          navigateToPage(tabIndex);
                                        });
                                      } else if (menuList[index].id == 10) {
                                        showLogoutConfirmationDialog();
                                      }
                                    });
                                  },
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, bottom: 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0),
                                          child: Text(
                                            menuList[index].title,
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: Color(
                                                    ColorConstants.whiteColor),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                color: Color(ColorConstants.COLOR_PRIMARY),
                                height: 0,
                                //height spacing of divider
                                thickness: 0,
                                //thickness of divier line
                                indent: 0,
                                //spacing at the start of divider
                                endIndent: 0,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(
                                  "assets/media/circular.png",
                                  width: 32.0,
                                  height: 32.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: Text(
                                  'Version ${packageInfo.version}',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      color: Color(ColorConstants.whiteColor),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: PageView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                tabIndex = index;
              });
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return HomeTab();
                case 1:
                  return ContactScreen();
                case 2:
                  return ContactScreen();
                case 3:
                  return ContactScreen();
                case 4:
                  return ContactScreen();
                case 5:
                  return ContactScreen();
                case 6:
                  return ContactScreen();
                case 7:
                  return ContactScreen();
                case 8:
                  return ContactScreen();
                case 9:
                  return ContactScreen();
                default:
                  return HomeTab();
              }
            },
          )), //Scaffold
    );
  }

  void showLogoutConfirmationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text(
                "Confirmation",
                style: GoogleFonts.arimo(
                  textStyle: const TextStyle(
                    color: Color(ColorConstants.DARK_BLUE),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                ),
              ),
              content: Text(
                "Are you sure, want to Logout?",
                style: GoogleFonts.arimo(
                  textStyle: const TextStyle(
                    color: Color(ColorConstants.DARK_BLUE),
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  ),
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  child: Text(
                    "Yes",
                    style: GoogleFonts.arimo(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.COLOR_LIGHT_RED),
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                        context, Utility.createCustomRoute(SplashScreen()));
                  },
                ),
                MaterialButton(
                  child: Text(
                    "No",
                    style: GoogleFonts.arimo(
                      textStyle: const TextStyle(
                        color: Color(ColorConstants.DARK_BLUE),
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
