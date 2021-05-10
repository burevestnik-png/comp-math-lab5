import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:comp_math_lab5/domain/models/interpolations/lagrange_interpolation.dart';
import 'package:comp_math_lab5/domain/models/interpolations/newton_interpolation.dart';
import 'package:get/get.dart';

class ComputationController extends GetxController {
  final _logger = Get.find<LogController>();
  final _drawingController = Get.find<DrawingController>();

  final _lagrangeMethod = LagrangeInterpolation();
  final _newtonInterpolation = NewtonInterpolation();

  void solve(List<Dot> dots, double x) {
    /*var lagrangeInterpolation = solveByLagrange(dots, x);
    var lagrangeDots = _generateInterpolationFunction(
      (val) => solveByLagrange(dots, val),
      min: dots.minX().x,
      max: dots.maxX().x,
    );*/
    // drawController.drawLineByDots(lagrangeDots);

    var newtonAnswer = _newtonInterpolation.process(dots, x);
  }
}
