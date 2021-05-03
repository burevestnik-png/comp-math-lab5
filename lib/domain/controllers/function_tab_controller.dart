import 'package:comp_math_lab5/domain/models/equation.dart';
import 'package:comp_math_lab5/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/trigonometric_token.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FunctionTabController extends GetxController {
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
    print('${equation.value} ${n.value} ${a.value} ${b.value}');
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
}
