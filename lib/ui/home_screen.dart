import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:isekaitec/ui/ui_modules/HomeScreenBody.dart';
import 'package:isekaitec/ui/ui_modules/homeAppDrawer.dart';
import 'package:isekaitec/ui/ui_modules/homeBottomAppBar.dart';
import 'package:isekaitec/utils/color_constants.dart';


class HomeScreen extends StatefulWidget {
  int selectedTab = 0;

  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    {
  bool animation = false;

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey();

  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            key: _scaffoldState,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                elevation: 0,
                backgroundColor: const Color(ColorConstants.whiteColor),
                automaticallyImplyLeading: false,
                // Don't show the leading button
                title: Container(
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(02, 20, 02, 10),
                  child: const TextField(
                    //controller: editingController,
                    style: TextStyle(color: Color(ColorConstants.COLOR_GREY)),
                    decoration: InputDecoration(
                        labelText: "Search Product",
                        hintText: "Search Product",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                ),
                actions: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(02, 15, 02, 10),
                      child: const Icon(
                        Icons.heart_broken_rounded,
                        size: 30,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(02, 15, 02, 10),
                      child: GestureDetector(
                        onTap: () {
                          // _scaffoldState.currentState?.openEndDrawer();
                        },
                        child: const Icon(
                          Icons.notifications,
                          size: 30,
                          color: Colors.grey,
                        ),
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
                            color: const Color(ColorConstants.COLOR_GREEN)),
                      ),
                    )
                  ]),
                  Container(
                    margin: const EdgeInsets.fromLTRB(02, 5, 00, 5),
                    child: IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        _scaffoldState.currentState?.openEndDrawer();
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 05.0,
                  )
                ],
              ),
            ),
            endDrawer: HomeAppDrawer(),
            bottomNavigationBar: HomeBottomAppBar(),
            body: HomeScreenBody()),
      ), //Scaffold
    );
  }

}
