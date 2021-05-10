import 'package:comp_math_lab5/domain/models/dot.dart';

abstract class Interpolation {
  double process(List<Dot> dots, double x);

  List<Dot> generateInterpolationFunction(
    List<Dot> initDots, {
    double accuracy = 0.01,
  }) {
    List<Dot> dots = [];
    for (var i = initDots.minX().x; i < initDots.maxX().x; i += accuracy) {
      dots.add(Dot(i, process(initDots, i)));
    }
    return dots;
  }
}
