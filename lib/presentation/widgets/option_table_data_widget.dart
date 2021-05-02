import 'package:comp_math_lab5/domain/state/main_screen_state.dart';
import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../styles/text_styles.dart';

class OptionTableData extends GetView<MainScreenState> {
  final xController = TextEditingController();
  final yController = TextEditingController();

  Widget _createDotTextField(TextEditingController controller) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            ),
          ),
        ),
      );

  Widget _createDataTable() {
    DataColumn createDataColumn(String label) {
      return DataColumn(
        label: Text(
          label,
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        numeric: false,
      );
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(
          () => DataTable(
            showBottomBorder: true,
            columns: <DataColumn>[
              createDataColumn("X"),
              createDataColumn("Y"),
            ],
            rows: controller.dots.map((dot) {
              return DataRow(
                selected: controller.selectedDots.contains(dot),
                onSelectChanged: (bool? isSelected) {
                  if (isSelected == null) return;

                  if (isSelected) {
                    controller.selectedDots.add(dot);
                  } else {
                    controller.selectedDots.remove(dot);
                  }
                },
                cells: [
                  DataCell(Text(dot.x.toString())),
                  DataCell(Text(dot.y.toString())),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _createTableButtons() {
    bool isDeleteSelectedButtonDisabled() =>
        controller.selectedDots.length == 0;

    bool isDeleteAllButtonDisabled() => controller.dots.length == 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => ElevatedButton(
            child: Text("Delete all (${controller.dots.length})"),
            onPressed:
                isDeleteAllButtonDisabled() ? null : controller.deleteAllDots,
          ),
        ),
        SizedBox(width: 30),
        Obx(
          () => ElevatedButton(
            child: Text("Delete ${controller.selectedDots.length} items"),
            onPressed: isDeleteSelectedButtonDisabled()
                ? null
                : controller.deleteSelectedDots,
          ),
        ),
      ],
    );
  }

  IconButton _createAddButton() {
    void addDot() {
      var x = double.tryParse(xController.text);
      var y = double.tryParse(yController.text);

      if (x != null && y != null) {
        controller.addDot(x, y);
      }
    }

    return IconButton(
      icon: Icon(Icons.add_box_outlined),
      iconSize: 30,
      onPressed: addDot,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        fieldText("Enter dots:"),
        SizedBox(height: 10),
        Row(
          children: [
            fieldText("X:", size: TextSize.MEDIUM),
            _createDotTextField(xController),
            fieldText("Y:", size: TextSize.MEDIUM),
            _createDotTextField(yController),
            _createAddButton(),
          ],
        ),
        _createDataTable(),
        SizedBox(height: 15),
        _createTableButtons(),
      ],
    );
  }
}
