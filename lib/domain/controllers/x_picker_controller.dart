import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class XPickerController extends GetxController {
  var x = 0.0.obs;
  var xController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    xController.text = x.toStringAsFixed(2);
  }

  void onDoubleFieldChange(
    String value, {
    required RxDouble obs,
  }) {
    var parsedValue = double.tryParse(value);
    if (parsedValue == null) return;

    obs.value = parsedValue;
  }
}
