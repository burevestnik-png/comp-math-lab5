import 'package:comp_math_lab5/domain/controllers/x_picker_controller.dart';
import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XPickerWidget extends GetView<XPickerController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 100,
            child: fieldText("Count for x:", size: TextSize.SMALL),
          ),
          SizedBox(
            width: 100,
            child: TextField(
              onChanged: (value) =>
                  controller.onDoubleFieldChange(value, obs: controller.x),
              controller: controller.xController,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
          VerticalDivider(thickness: 1, width: 1),
        ],
      ),
    );
  }
}
