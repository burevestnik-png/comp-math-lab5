import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionTextField extends StatelessWidget {
  final String content;
  final TextEditingController controller;
  final void Function(String)? onChange;

  OptionTextField({
    required this.content,
    required this.onChange,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 100,
          child: fieldText(content, size: TextSize.SMALL),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: onChange,
              controller: controller,
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
        ),
      ],
    );
  }
}
