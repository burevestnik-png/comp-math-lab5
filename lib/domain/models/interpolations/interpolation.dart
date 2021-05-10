import 'package:comp_math_lab5/domain/models/dot.dart';

abstract class Interpolation {
  double process(List<Dot> dots, double x);

  static List<Dot> generateInterpolationFunction(
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
}
