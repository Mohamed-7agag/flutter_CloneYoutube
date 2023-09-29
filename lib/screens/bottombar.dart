// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';
import 'package:flutter_application_cloneyoutube/screens/cleancodescreen.dart';
import 'package:flutter_application_cloneyoutube/screens/dartscreen.dart';
import 'package:flutter_application_cloneyoutube/screens/getxscreen.dart';
import 'package:flutter_application_cloneyoutube/screens/homescreen.dart';
import 'package:flutter_application_cloneyoutube/screens/videoDetail.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  SvgPicture image = SvgPicture.asset(
    "assets/images/library_off.svg",
    width: 28,
  );

  int currenttab = 4;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Homepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          leadingWidth: 230,
          leading: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                radius: 20,
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    size: 27,
                  )),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.notifications_none_outlined,
                size: 27,
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
            ],
          ),
          actions: [
            Image.asset(
              "assets/images/ytlogo.png",
              width: 110,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.only(top: 6),
            height: 55,
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      currenttab = 0;
                      currentScreen = GetxScreen();
                    });
                  },
                  child: Column(
                    children: [
                      currenttab == 0
                          ? SvgPicture.asset(
                              "assets/images/library_on.svg",
                              width: 28,
                            )
                          : SvgPicture.asset(
                              "assets/images/library_off.svg",
                              width: 28,
                            ),
                      Text(
                        "GetX",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currenttab = 1;
                      currentScreen = CleanCodeScreen();
                    });
                  },
                  child: Column(
                    children: [
                      currenttab == 1
                          ? SvgPicture.asset(
                              "assets/images/subs_on.svg",
                              width: 28,
                            )
                          : SvgPicture.asset(
                              "assets/images/subs_off.svg",
                              width: 28,
                            ),
                      Text(
                        "CleanCode",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.only(
                            left: 5, top: 15, right: 10, bottom: 20),
                        height: 360,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      color: const Color.fromARGB(123, 0, 0, 0),
                                    )),
                                Text(
                                  "أنشاء",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Shorts  أنشاء فيديو",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(
                                    Icons.create_rounded,
                                    color: Colors.black,
                                    size: 27,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "تحميل فيديو",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(
                                    Icons.upload_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "بث محتوي مباشر",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(
                                    Icons.cast,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "أنشاء مشاركة",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.grey[200],
                                  child: Icon(
                                    Icons.ios_share_outlined,
                                    color: Colors.black,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: Container(
                    child: SvgPicture.asset("assets/images/plus.svg"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = DartScreen();
                    });
                    currenttab = 3;
                  },
                  child: Column(
                    children: [
                      currenttab == 3
                          ? SvgPicture.asset(
                              "assets/images/compass_on.svg",
                              width: 28,
                            )
                          : SvgPicture.asset(
                              "assets/images/compass_off.svg",
                              width: 28,
                            ),
                      Text(
                        "Dart",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = Homepage();
                    });
                    currenttab = 4;
                  },
                  child: Column(
                    children: [
                      currenttab == 4
                          ? SvgPicture.asset(
                              "assets/images/home_on.svg",
                              width: 28,
                            )
                          : SvgPicture.asset(
                              "assets/images/home_off.svg",
                              width: 28,
                            ),
                      Text(
                        "Home",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          elevation: 15,
        ),
        body: currenttab == 4
            ? Homepage()
            : currenttab == 3
                ? DartScreen()
                : currenttab == 1
                    ? CleanCodeScreen()
                    : GetxScreen());
  }
}

class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter =
        searchItems.where((element) => element.contains(query)).toList();
    return ListView.builder(
      itemCount: filter.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            int pos = 0;
            for (int i = 0; i < searchItems.length; i++) {
              if (filter[index] == searchItems[i]) {
                pos = i;
                break;
              }
            }
            Get.to(() => VideoDetails(videoIndex: pos, video: videoItems));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "${filter[index]}",
                  style: TextStyle(fontSize: 15),
                  textDirection: TextDirection.rtl,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[200],
              )
            ],
          ),
        );
      },
    );
  }
}
