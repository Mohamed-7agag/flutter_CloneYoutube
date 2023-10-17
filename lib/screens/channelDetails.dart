// ignore_for_file: avoid_print, sized_box_for_whitespace, file_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/constant.dart';

class ChannelDetails extends StatefulWidget {
  const ChannelDetails({super.key});

  @override
  State<ChannelDetails> createState() => _ChannelDetailsState();
}

class _ChannelDetailsState extends State<ChannelDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readChannelJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: readChannelJson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            } else if (snapshot.hasError) {
              print("---${snapshot.error}---");
            }
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/OIP.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 38,
                          backgroundImage:
                              Image.asset("assets/images/logo.png").image,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${channel[0]['snippet']['title']}",
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " . ${channel[0]['statistics']['videoCount']} فيديو",
                              style: const TextStyle(fontSize: 16),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              " . ${channel[0]['statistics']['subscriberCount']} مشترك",
                              style: const TextStyle(fontSize: 16),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "${channel[0]['snippet']['customUrl']}",
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          " . ${channel[0]['snippet']['description']}",
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "أشتراك",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 45,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "أنضمام",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
