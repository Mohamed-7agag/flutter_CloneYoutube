// ignore_for_file:, file_names, sort_child_properties_last,sized_box_for_whitespace

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
  Widget currentScreen = const Homepage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          leadingWidth: 230,
          leading: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                child: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                radius: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    size: 25,
                  )),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.notifications_none_outlined,
                size: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cast,
                    size: 23,
                  )),
            ],
          ),
          actions: [
            Image.asset(
              "assets/images/ytlogo.png",
              width: 110,
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.only(top: 6),
            height: 55,
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      currenttab = 0;
                      currentScreen = const GetxScreen();
                    });
                  },
                  child: Column(
                    children: [
                      currenttab == 0
                          ? SvgPicture.asset(
                              "assets/images/library_on.svg",
                              width: 25,
                            )
                          : SvgPicture.asset(
                              "assets/images/library_off.svg",
                              width: 25,
                            ),
                      const Text(
                        "GetX",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currenttab = 1;
                      currentScreen = const CleanCodeScreen();
                    });
                  },
                  child: Column(
                    children: [
                      currenttab == 1
                          ? SvgPicture.asset(
                              "assets/images/subs_on.svg",
                              width: 25,
                            )
                          : SvgPicture.asset(
                              "assets/images/subs_off.svg",
                              width: 25,
                            ),
                      const Text(
                        "CleanCode",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, top: 10, right: 12, bottom: 20),
                          height: 360,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.close_rounded,
                                        size: 35,
                                        color: Colors.black,
                                      )),
                                  const Text(
                                    "أنشاء",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Shorts  أنشاء فيديو",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 21,
                                    backgroundColor: Colors.grey[200],
                                    child: const Icon(
                                      Icons.create_rounded,
                                      color: Colors.black,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "تحميل فيديو",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 21,
                                    backgroundColor: Colors.grey[200],
                                    child: const Icon(
                                      Icons.upload_rounded,
                                      color: Colors.black,
                                      size: 27,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "بث محتوي مباشر",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 21,
                                    backgroundColor: Colors.grey[200],
                                    child: const Icon(
                                      Icons.cast,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "أنشاء مشاركة",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 21,
                                    backgroundColor: Colors.grey[200],
                                    child: const Icon(
                                      Icons.ios_share_outlined,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset("assets/images/plus.svg"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = const DartScreen();
                    });
                    currenttab = 3;
                  },
                  child: Column(
                    children: [
                      currenttab == 3
                          ? SvgPicture.asset(
                              "assets/images/compass_on.svg",
                              width: 25,
                            )
                          : SvgPicture.asset(
                              "assets/images/compass_off.svg",
                              width: 25,
                            ),
                      const Text(
                        "Dart",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentScreen = const Homepage();
                    });
                    currenttab = 4;
                  },
                  child: Column(
                    children: [
                      currenttab == 4
                          ? SvgPicture.asset(
                              "assets/images/home_on.svg",
                              width: 25,
                            )
                          : SvgPicture.asset(
                              "assets/images/home_off.svg",
                              width: 25,
                            ),
                      const Text(
                        "Home",
                        style: TextStyle(fontSize: 10),
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
            ? const Homepage()
            : currenttab == 3
                ? const DartScreen()
                : currenttab == 1
                    ? const CleanCodeScreen()
                    : const GetxScreen());
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
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("");
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
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 320,
                      child: Text(
                        "${filter[index]}",
                        style: const TextStyle(fontSize: 12),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.restore,
                      size: 30,
                    )
                  ],
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
