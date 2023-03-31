import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/models/product_category.dart';
import 'package:isekaitec/models/user_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../connection/presenters/impls/register_user_presenter_impl.dart';
import '../../connection/presenters/register_user_presenter.dart';
import '../../models/drawer_items_model.dart';
import '../../utils/authentication.dart';
import '../../utils/color_constants.dart';
import '../../utils/utility.dart';
import '../sign_in_screen.dart';

class HomeAppDrawer extends StatefulWidget {
  int selectedTab = 0;
  @override
  _HomeAppDrawer createState() => _HomeAppDrawer();
}

class _HomeAppDrawer extends State<HomeAppDrawer>
    implements RegisterUserContractView {
  late List<DrawerItemModel> menuList;
  late PageController pageController;
  int tabIndex = 0, userId = 0;
  late List<ProductCategory> productCategoryList = productCategoryList = [];
  late RegisterUserPresenter registerPresenter;

  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

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
  void initState() {
    super.initState();
    menuList = [];

    registerPresenter = RegisterUserPresenterImpl(this);
    initAPI();
    if (widget.selectedTab != null && widget.selectedTab != 0) {
      tabIndex = widget.selectedTab;
    }
    pageController = PageController(initialPage: tabIndex);
    initPackageInfo();

    for (ProductCategory product in productCategoryList) {
      log('data: Null $product');
      menuList.add(DrawerItemModel(product.id, product.name));
    }

/*
    menuList.add(DrawerItemModel(1, "My Profile"));
    menuList.add(DrawerItemModel(2, "My Contact List"));
    menuList.add(DrawerItemModel(3, "Help & Support"));
    menuList.add(DrawerItemModel(4, "Subscription Plans"));
    menuList.add(DrawerItemModel(5, "Switch Account"));
    menuList.add(DrawerItemModel(6, "Logout"));*/
  }

  void initAPI() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Utility.showLoader(context);
      //registerPresenter.getTop20Items();
      registerPresenter.getProductCategoryApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        backgroundColor: const Color(ColorConstants.COLOR_PRIMARY),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
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
                                    padding: const EdgeInsets.only(top: 5.0),
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
                                  const SizedBox(
                                    width: 8.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
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
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              setState(() {
                                // _scaffoldState.currentState.closeDrawer();
                                Navigator.pop(context);
                                Future.delayed(
                                    const Duration(milliseconds: 120));
                                if (productCategoryList[index].id == 0) {
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
                                } else if (menuList[index].id == 6) {
                                  showLogoutConfirmationDialog();
                                }
                              });
                            },
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Text(
                                      menuList[index].title!!,
                                      style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                          color:
                                              Color(ColorConstants.whiteColor),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
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
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 5.0),
                          child: Text(
                            'Version ${packageInfo.version}',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Color(ColorConstants.whiteColor),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
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
                    Authentication.signOut(context: context);
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context,
                        Utility.createCustomRoute(const SignInScreen()));
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

  @override
  void onError(String error) {
    Utility.hideLoader(context);
    log('data: Null $error');
  }

  @override
  void onSuccessProductCategory(List<ProductCategory>? productCategory) {
    Utility.hideLoader(context);
    log('dataDDD: ${productCategory![0].id}');
    if (!productCategory[0].id!.isNull) {
      log('data: ${productCategory[0].id}');
      productCategoryList.addAll(productCategory);

      for (ProductCategory product in productCategoryList) {
        log('data: Null $product');
        menuList.add(DrawerItemModel(product.id, product.name));
      }
      setState(() {});
    } else {
      log('data: Null');
    }
  }

  @override
  void onSuccessRegisterUser(List<UserModel>? userModel) {}
}
