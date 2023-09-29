// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetails extends StatefulWidget {
  final int videoIndex;
  final List video;
  const VideoDetails(
      {super.key, required this.videoIndex, required this.video});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: widget.video[widget.videoIndex]["id"]["videoId"],
        flags: YoutubePlayerFlags(
          mute: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                key: UniqueKey(),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "${widget.video[widget.videoIndex]["snippet"]["title"]}",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          textDirection: TextDirection.rtl,
                          "${widget.video[widget.videoIndex]["snippet"]["publishTime"].toString().substring(0, 10)}",
                          style: TextStyle(
                              fontSize: 15,
                              height: 1.4,
                              color: Colors.grey[600]),
                          overflow: TextOverflow.visible,
                        ),
                        Text(
                          "  . viewcount",
                          style: TextStyle(
                              fontSize: 15,
                              height: 1.4,
                              color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.video[widget.videoIndex]["snippet"]['description']}",
                      style: TextStyle(
                          fontSize: 15, height: 1.45, color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 14),
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(221, 0, 0, 0)
                            
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.notifications,color: Colors.white,),
                              Text("أشتراك",style: TextStyle(color: Colors.white,fontSize: 17),)
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                        textDirection: TextDirection.rtl,
                        "${widget.video[widget.videoIndex]["snippet"]["channelTitle"]}",
                        style: TextStyle(fontSize: 20, height: 1.4,fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 5,),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          backgroundImage:
                              Image.asset("assets/images/logo.png").image,
                        ),
                          ],
                        )
                        
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 85,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200]),
                      child: Text("التعليقات",style: TextStyle(fontSize: 18),textDirection: TextDirection.rtl,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
