import 'package:comp_math_lab5/domain/controllers/function_tab_controller.dart';
import 'package:comp_math_lab5/presentation/widgets/option_dropdown_widget.dart';
import 'package:comp_math_lab5/presentation/widgets/option_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FunctionTab extends GetView<FunctionTabController> {
  space([double height = 10.0]) => SizedBox(height: height);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        space(),
        OptionTextField(
          content: "Enter here:",
          controller: controller.equationController,
          onChange: (value) =>
              controller.onStringFieldChange(value, obs: controller.equation),
        ),
        space(),
        OptionDropdown(
          text: "Or just pick:",
          items: controller.equations,
          obs: controller.equations.first.obs,
          onChange: controller.onPresetedEquationChange,
        ),
        space(15),
        OptionTextField(
          content: "Left border:",
          controller: controller.aController,
          onChange: (String value) => controller.onDoubleFieldChange(
            value,
            obs: controller.a,
          ),
        ),
        space(),
        OptionTextField(
          content: "Right border:",
          controller: controller.bController,
          onChange: (String value) => controller.onDoubleFieldChange(
            value,
            obs: controller.b,
          ),
        ),
        space(),
        OptionTextField(
          content: "n:",
          controller: controller.nController,
          onChange: (String value) => controller.onIntFieldChange(
            value,
            obs: controller.n,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: controller.onComputeAction,
                child: Text("Compute"),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: controller.reset,
                child: Text("Reset"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
