// ignore_for_file: avoid_print, unused_local_variable,sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/component/box.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';
import 'package:flutter_application_cloneyoutube/screens/videoDetail.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readAllVideoJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readAllVideoJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2.7,
              ),
            );
          } else if (snapshot.hasError) {
            print("---${snapshot.error}---");
          }
          return ListView.builder(
            itemCount: videoItems.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(() => VideoDetails(
                        videoIndex: index,
                        video: videoItems,
                      ));
                },
                child: VideoBox(
                  videoIndex: index,
                  items: videoItems,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
