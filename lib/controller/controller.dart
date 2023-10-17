// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class MyController extends GetxController {
  bool click = false;
  String word = "أشتراك";
  void ChangeClick() {
    click = !click;
    update();
  }
}
