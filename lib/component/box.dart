// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_application_cloneyoutube/screens/channelDetails.dart';
import 'package:get/get.dart';

class VideoBox extends StatefulWidget {
  final int videoIndex;
  final List items;
  const VideoBox({super.key, required this.videoIndex, required this.items});

  @override
  State<VideoBox> createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Column(
        children: [
          Container(
            height: 225,
            color: Colors.grey[200],
            child: Image.network(
              "${widget.items[widget.videoIndex]["snippet"]["thumbnails"]["medium"]["url"]}",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => const ChannelDetails());
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        Image.asset("assets/images/logo.png").image,
                  ),
                ),
                Container(
                  width: 290,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        textDirection: TextDirection.rtl,
                        "${widget.items[widget.videoIndex]["snippet"]["title"]}",
                        style: const TextStyle(fontSize: 13, height: 1.4),
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "${widget.items[widget.videoIndex]["snippet"]["channelTitle"]}  .  ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.4,
                                color: Colors.grey[600]),
                            overflow: TextOverflow.visible,
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            "${widget.items[widget.videoIndex]["snippet"]["publishTime"].toString().substring(0, 10)} . ",
                            style: TextStyle(
                                fontSize: 11,
                                height: 1.4,
                                color: Colors.grey[600]),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.more_vert,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
