// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/component/box.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';
import 'package:flutter_application_cloneyoutube/screens/videoDetail.dart';
import 'package:get/get.dart';

class CleanCodeScreen extends StatefulWidget {
  const CleanCodeScreen({super.key});

  @override
  State<CleanCodeScreen> createState() => _CleanCodeScreenState();
}

class _CleanCodeScreenState extends State<CleanCodeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readAllCleanCodeVideoJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readAllCleanCodeVideoJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.red,strokeWidth: 2.7,),
            );
          } else if (snapshot.hasError) {
            print("---${snapshot.error}---");
          }
          return ListView.builder(
            itemCount: cleanCodeItems.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(() => VideoDetails(
                        videoIndex: index,
                        video: cleanCodeItems,
                      ));
                },
                child: VideoBox(videoIndex : index, items: cleanCodeItems,),
              );
            },
          );
        },
      ),
    );
  }
}
