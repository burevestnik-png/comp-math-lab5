import 'package:comp_math_lab5/domain/models/dot.dart';
import 'package:comp_math_lab5/domain/models/interpolations/interpolation.dart';

class NewtonInterpolation extends Interpolation {
  @override
  double process(List<Dot> dots, double x) {
    var h = dots[1].x - dots[0].x;
    var tableOfFiniteDiffs = _createTableOfFiniteDiffs(dots);

    var result = 0.0;
    if (x <= dots.getMiddle().x) {
      // Интерполяция вперед
      var x0 = 0;
      for (var i = 0; i < dots.length; i++) {
        if (x >= dots[i].x) {
          x0 = i;
        }
      }

      var t = (x - dots[x0].x) / h;

      result = tableOfFiniteDiffs[x0][0];
      for (var i = 1; i < dots.length; i++) {
        result += _getFactor(t, i) / _factorial(i) * tableOfFiniteDiffs[x0][i];
      }
    } else {
      // Интерполяция назад
      var t = (x - dots.last.x) / h;

      result = tableOfFiniteDiffs[dots.length - 1][0];
      for (var i = 1; i < dots.length; i++) {
        result += _getFactor(t, i, isForward: false) /
            _factorial(i) *
            tableOfFiniteDiffs[dots.length - i - 1][i];
      }
    }

    return result;
  }

  int _factorial(int n) => n == 0 ? 1 : n * _factorial(n - 1);

  double _getFactor(
    double initialFactor,
    int n, {
    bool isForward = true,
  }) {
    var factor = initialFactor;
    for (var i = 1; i < n; i++) {
      if (isForward) {
        factor *= (initialFactor - i);
      } else {
        factor *= (initialFactor + i);
      }
    }

    return factor;
  }

  List<List<double>> _createTableOfFiniteDiffs(List<Dot> dots) {
    List<List<double>> tableOfFiniteDiffs = List.generate(
      dots.length,
      (index) => List.generate(dots.length, (index) => 0),
    );

    for (var i = 0; i < dots.length; i++) {
      tableOfFiniteDiffs[i][0] = dots[i].y;
    }

    for (var i = 1; i < dots.length; i++) {
      for (var j = 0; j < dots.length - i; j++) {
        tableOfFiniteDiffs[j][i] =
            tableOfFiniteDiffs[j + 1][i - 1] - tableOfFiniteDiffs[j][i - 1];
      }
    }

    return tableOfFiniteDiffs;
  }
}
