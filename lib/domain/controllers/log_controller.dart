import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogController extends GetxController {
  var logs = TextEditingController(text: "");
  var scrollController = ScrollController();
  var _index = 1;

  void scrollToBottom() => scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: SawTooth(3),
      );

  void clean() {
    logs.clear();
    _index = 1;
  }

  void println([String? string]) {
    logs.text = logs.text + "$prefix${string ?? ""}\n";
    _index++;
  }

  void printdln([String? string]) {
    logs.text = logs.text + "$prefix${string ?? ""}\n";
    _index++;
    println();
    _index++;
  }

  String get prefix => "$_index : ";
}
