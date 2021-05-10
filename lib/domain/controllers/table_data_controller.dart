import 'package:comp_math_lab5/domain/controllers/computation_controller.dart';
import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/x_picker_controller.dart';
import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:get/get.dart';

class TableDataController extends GetxController {
  final _drawingController = Get.find<DrawingController>();
  final _computationController = Get.find<ComputationController>();
  final _xPickerController = Get.find<XPickerController>();

  int _lineId = 0;

  final selectedDots = <Dot>[].obs;
  final dots = <Dot>[
    Dot(0.1, 1.25),
    Dot(0.2, 2.38),
    Dot(0.3, 3.79),
    Dot(0.4, 5.44),
    Dot(0.5, 7.14),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _redrawLine();
  }

  void addDot(double x, double y) {
    dots.add(Dot(x, y));
    dots.sort((first, second) => first.x.compareTo(second.x));
    _redrawLine();
  }

  void deleteSelectedDots() {
    if (selectedDots.isNotEmpty) {
      var tmpDots = <Dot>[].obs;

      tmpDots.addAll(selectedDots);
      for (Dot dot in tmpDots) {
        dots.remove(dot);
        selectedDots.remove(dot);
      }

      _redrawLine();
    }
  }

  void deleteAllDots() {
    selectedDots.clear();
    dots.clear();
    _redrawLine();
  }

  void compute() {
    _computationController.solve(dots, _xPickerController.x.value);
  }

  void _redrawLine() => _lineId = _drawingController.drawLineByDots(
        dots,
        id: _lineId,
        shouldForceRedraw: true,
      );
}
