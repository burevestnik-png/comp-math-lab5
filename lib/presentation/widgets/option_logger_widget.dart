import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OptionLogger extends GetView<LogController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldText("Logs:"),
        SizedBox(height: 10),
        TextField(
          controller: controller.logs,
          keyboardType: TextInputType.multiline,
          maxLines: 7,
          readOnly: true,
          scrollController: controller.scrollController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Here there will be computational logs...",
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.scrollToBottom,
              child: Text("Scroll to bottom"),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: controller.clean,
              child: Text("Clean"),
            ),
          ],
        ),
      ],
    );
  }
}
