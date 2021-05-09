import 'package:comp_math_lab5/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab5/domain/controllers/log_controller.dart';
import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:get/get.dart';

class ComputationController extends GetxController {
  final logger = Get.find<LogController>();
  final drawController = Get.find<DrawingController>();

  double solveByLagrange(List<Dot> dots, double x) {
    var lagrange = 0.0;
    var xValues = dots.x();
    var yValues = dots.y();

    for (var i = 0; i < yValues.length; i++) {
      var factor = 1.0;

      for (var j = 0; j < xValues.length; j++) {
        if (i != j) {
          factor *= (x - xValues[j]) / (xValues[i] - xValues[j]);
        }
      }

      lagrange += yValues[i] * factor;
    }

    return lagrange;
  }

  List<Dot> _generateInterpolationFunction(
    double Function(double) generator, {
    required double min,
    required double max,
    double accuracy = 0.01,
  }) {
    List<Dot> dots = [];
    for (var i = min; i < max; i += accuracy) {
      dots.add(Dot(i, generator(i)));
    }
    return dots;
  }

  void solve(List<Dot> dots, double x) {
    var lagrangeInterpolation = solveByLagrange(dots, x);
    var lagrangeDots = _generateInterpolationFunction(
      (val) => solveByLagrange(dots, val),
      min: dots.minX().x,
      max: dots.maxX().x,
    );
    // drawController.drawLineByDots(lagrangeDots);
  }
}
