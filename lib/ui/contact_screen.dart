import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isekaitec/ui/splash_screen.dart';
import 'package:isekaitec/utils/color_constants.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/drawer_items_model.dart';
import '../utils/constants.dart';
import '../utils/utility.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  ContactScreenState createState() => ContactScreenState();
}

class ContactScreenState extends State<ContactScreen> {
  // late Iterable<Contact?> _contacts = [];
  List<Contact> _contacts = <Contact>[];
  static bool contact = false;
  var permissionFuture1, permissionFuture2, permissionFuture3;
  TextEditingController editingController = TextEditingController();
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
    _getPermission();
  }

  Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorConstants.COLOR_HOME_BACKGROUND),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(0),
              decoration: const BoxDecoration(
                color: Color(ColorConstants.whiteColor),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: TextField(
                onChanged: (value) {
                  //filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: _contacts != null
                  // display name
                  ? ListView.separated(
                      itemCount: _contacts?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        Contact? contact = _contacts?.elementAt(index);
                        Uint8List? avatar = contact!.avatar;
                        return ListTile(
                          leading: (contact!.avatar != null &&
                                  contact!.avatar!.isNotEmpty)
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(avatar!),
                                )
                              : CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).accentColor,
                                  child: Text(contact!.initials()),
                                ),
                          title: Text(contact!.displayName ?? ''),
                          //This can be further expanded to showing contacts detail
                          // onPressed().
                          onTap: () =>
                              showLogoutConfirmationDialog(contact, avatar),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                        color: Colors.black,
                        height: 0.4,
                        indent: 70,
                        endIndent: 20,
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            )
          ]),
    );
  }

  Future<void> _getPermission() async {
    Future.delayed(const Duration(seconds: 0), () async {
      if ((await Utility.contactPermissionStatus()) ==
          PermissionStatus.granted) {
        setState(() async {
          contact = true;
          final Iterable<Contact> contacts =
              await ContactsService.getContacts();
          setState(() {
            _contacts = contacts as List<Contact>;
          });
        });
      } else {
        permissionFuture1 = await Utility.requestContactPermission();
        if (permissionFuture1 == PermissionStatus.granted) {
          _getPermission();
        }
      }
    });
  }

  void filterSearchResults(String query) {
    List<Contact> dummySearchList = <Contact>[];
    dummySearchList.addAll(_contacts);
    if (query.isNotEmpty) {
      List<Contact> dummyListData = <Contact>[];
      for (var item in dummySearchList) {
        //if (item.contains(query)) {
        dummyListData.add(item);
        //}
      }
      setState(() {
        _contacts.clear();
        _contacts.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _contacts.clear();
        _contacts.addAll(_contacts);
      });
    }
  }

  void showLogoutConfirmationDialog(Contact? contact, Uint8List? avatar) {
    String? displayName = contact!.displayName;
    String? initials = contact!.initials();
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 160,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(ColorConstants.whiteColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        (avatar != null && avatar!.isNotEmpty)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(avatar!),
                              )
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                child: Text(initials!),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: displayName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    decoration: TextDecoration.none),
                              ),
                              const WidgetSpan(
                                  alignment: PlaceholderAlignment.baseline,
                                  baseline: TextBaseline.alphabetic,
                                  child: SizedBox(width: 10)),
                              WidgetSpan(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/icons/vector.png",
                                      height: 15,
                                      width: 15,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color(ColorConstants.COLOR_THEME_GREEN),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Text(
                        "Send Caregiver Request",
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              color: Color(ColorConstants.whiteColor),
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
