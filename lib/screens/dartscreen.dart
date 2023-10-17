// ignore_for_file:, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/component/box.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';
import 'package:flutter_application_cloneyoutube/screens/videoDetail.dart';
import 'package:get/get.dart';

class DartScreen extends StatefulWidget {
  const DartScreen({super.key});

  @override
  State<DartScreen> createState() => _DartScreenState();
}

class _DartScreenState extends State<DartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readAllDartVideoJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readAllDartVideoJson(),
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
            itemCount: dartItems.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(() => VideoDetails(
                        videoIndex: index,
                        video: dartItems,
                      ));
                },
                child: VideoBox(
                  videoIndex: index,
                  items: dartItems,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
