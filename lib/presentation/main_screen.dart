import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/state/main_screen_state.dart';
import 'package:comp_math_lab5/presentation/widgets/options_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenState> {
  static final String id = '/';

  final DrawingController _drawingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Approximation computation application"),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Options(),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: LineChart(_drawingController.chartData)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
