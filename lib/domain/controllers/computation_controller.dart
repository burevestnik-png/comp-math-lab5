import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:comp_math_lab5/domain/models/interpolations/lagrange_interpolation.dart';
import 'package:comp_math_lab5/domain/models/interpolations/newton_interpolation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComputationController extends GetxController {
  final _logger = Get.find<LogController>();
  final _drawingController = Get.find<DrawingController>();

  var lagrangeLineId = 0;
  var newtonLineId = 0;

  final _lagrangeMethod = LagrangeInterpolation();
  final _newtonInterpolation = NewtonInterpolation();

  void solve(List<Dot> dots, double x) {
    var lagrangeAnswer = _lagrangeMethod.process(dots, x);
    var lagrangeDots = _lagrangeMethod.generateInterpolationFunction(dots);

    var newtonAnswer = _newtonInterpolation.process(dots, x);
    var newtonDots = _newtonInterpolation.generateInterpolationFunction(dots);

    _logger.println("Interpolating for x: $x");
    _logger.println("Answer by lagrange: $lagrangeAnswer");
    _logger.printdln("Answer by newton: $newtonAnswer");

    lagrangeLineId = _drawingController.drawLineByDots(
      lagrangeDots,
      id: lagrangeLineId,
      showDots: false,
      color: Colors.green,
    );

    newtonLineId = _drawingController.drawLineByDots(
      newtonDots,
      id: newtonLineId,
      showDots: false,
      color: Colors.blue,
    );
  }
}
