import 'dart:convert';
import 'package:flutter/services.dart';

Map allVideo = {};
Map allGetXVideo = {};
Map allDartVideo = {};
Map allCleanCodeVideo = {};
List videoItems = [];
List<String> searchItems = [];
List getXItems = [];
List cleanCodeItems = [];
List dartItems = [];

Future readAllVideoJson() async {
  final String response =
      await rootBundle.loadString("assets/fonts/AllVideo.json");
  final data = json.decode(response);
  allVideo = data;
  videoItems = data['items'];
  for (int i = 0; i < videoItems.length; i++) {
    searchItems.add(videoItems[i]['snippet']['title']);
  }
  return [allVideo, videoItems];
}

Future readAllGetXVideoJson() async {
  final String response =
      await rootBundle.loadString("assets/fonts/AllGetXVideo.json");
  final data = json.decode(response);
  allGetXVideo = data;
  getXItems = data['items'];
  return [allGetXVideo, getXItems];
}

Future readAllCleanCodeVideoJson() async {
  final String response =
      await rootBundle.loadString("assets/fonts/AllCleanCodeVideo.json");
  final data = json.decode(response);
  allCleanCodeVideo = data;
  cleanCodeItems = data['items'];
  return [allCleanCodeVideo, cleanCodeItems];
}

Future readAllDartVideoJson() async {
  final String response =
      await rootBundle.loadString("assets/fonts/AllDartVideo.json");
  final data = json.decode(response);
  allDartVideo = data;
  dartItems = data['items'];
  return [allDartVideo, dartItems];
}
