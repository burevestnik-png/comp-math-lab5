import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:comp_math_lab5/domain/models/interpolations/interpolation.dart';

class LagrangeInterpolation extends Interpolation {
  @override
  double process(List<Dot> dots, double x) {
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
}
