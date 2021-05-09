import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/models/equation.dart';
import 'package:comp_math_lab5/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/trigonometric_token.dart';
import 'package:comp_math_lab5/domain/utils/equation_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FunctionTabController extends GetxController {
  final _drawingController = Get.find<DrawingController>();
  final _equationParser = EquationParser();

  var _lineId = 0;

  final equations = <Equation>[
    Equation([TrigonometricToken.sin(1, 1)]),
    Equation([
      PolynomialToken(3, 2),
      PolynomialToken(-1, 1),
      ConstToken(5),
    ]),
  ];

  var equation = "".obs;
  var a = (-10.0).obs;
  var b = 10.0.obs;
  var n = 10.obs;

  final equationController = TextEditingController();
  final aController = TextEditingController();
  final bController = TextEditingController();
  final nController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _restoreFieldControllers();
  }

  void onPresetedEquationChange(Equation equation) {
    equationController.text = equation.toString();
    onStringFieldChange(equation.toString(), obs: this.equation);
  }

  void onStringFieldChange(String value, {required RxString obs}) {
    obs.value = value;
  }

  void onDoubleFieldChange(
    String value, {
    required RxDouble obs,
  }) {
    var parsedValue = double.tryParse(value);
    if (parsedValue == null) return;

    obs.value = parsedValue;
    // if (isBordersCorrect()) _redraw();
  }

  void onIntFieldChange(
    String value, {
    required RxInt obs,
  }) {
    var parsedValue = int.tryParse(value);
    if (parsedValue == null) return;

    obs.value = parsedValue;
    // if (isNCorrect()) _redraw();
  }

  bool isBordersCorrect() => a.value < b.value;

  bool isNCorrect() => n.value >= 1 && n.value <= 30;

  void onComputeAction() {
    if (isBordersCorrect() && isNCorrect() && equation.value.isNotEmpty) {
      print('${equation.value} ${n.value} ${a.value} ${b.value}');
      _redraw();
    }
  }

  void reset() {
    equation.value = "";
    a.value = -10.0;
    b.value = 10.0;
    n.value = 10;

    _restoreFieldControllers();
  }

  void _restoreFieldControllers() {
    equationController.text = equation.value;
    aController.text = a.value.toStringAsFixed(0);
    bController.text = b.value.toStringAsFixed(0);
    nController.text = n.value.toString();
  }

  void _redraw() {
    _lineId = _drawingController.drawLineByEquation(
      _equationParser.createEquationFomString(equation.value),
      id: _lineId,
      min: a.value,
      max: b.value,
      n: n.value,
      shouldForceRedraw: true,
    );
  }
}
