// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

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
      margin: EdgeInsets.only(bottom: 6),
      child: Column(
        children: [
          Container(
            height: 228,
            color: Colors.grey[200],
            child: Image.network(
              "${widget.items[widget.videoIndex]["snippet"]["thumbnails"]["medium"]["url"]}",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => ChannelDetails());
                  },
                  child: CircleAvatar(
                    radius: 24,
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
                        style: TextStyle(fontSize: 15, height: 1.4),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            "${widget.items[widget.videoIndex]["snippet"]["channelTitle"]}  .  ",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.grey[600]),
                            overflow: TextOverflow.visible,
                          ),
                          Text(
                            textDirection: TextDirection.rtl,
                            "${widget.items[widget.videoIndex]["snippet"]["publishTime"].toString().substring(0, 10)} . ",
                            style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.grey[600]),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
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
