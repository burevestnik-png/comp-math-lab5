import 'package:fl_chart/fl_chart.dart';
import 'package:uuid/uuid.dart';

class Dot {
  final String id;
  final double x;
  final double y;

  Dot(this.x, this.y) : id = Uuid().v4();

  @override
  String toString() {
    return 'Dot{id: $id, x: $x, y: $y}';
  }
}

extension DotExtension on Dot {
  FlSpot toFlSpot() => FlSpot(this.x, this.y);
}

extension DotsExtension on List<Dot> {
  List<FlSpot> toFLSpots() => _forEach<FlSpot>((dot) => dot.toFlSpot());

  List<double> x() => _forEach<double>((dot) => dot.x);

  List<double> y() => _forEach<double>((dot) => dot.y);

  Dot getMiddle() => this[(this.length / 2).ceil()];

  List<T> _forEach<T>(T Function(Dot) callback) {
    List<T> points = [];
    for (var value in this) {
      points.add(callback(value));
    }
    return points;
  }

  Dot minX() =>
      _find(Dot(double.infinity, 0.0), (dot, minDot) => dot.x < minDot.x);

  Dot maxX() => _find(
      Dot(double.negativeInfinity, 0.0), (dot, maxDot) => dot.x > maxDot.x);

  Dot minY() =>
      _find(Dot(0.0, double.infinity), (dot, minDot) => dot.y < minDot.y);

  Dot maxY() => _find(
      Dot(0.0, double.negativeInfinity), (dot, maxDot) => dot.y > maxDot.y);

  Dot _find(Dot initialDot, bool Function(Dot, Dot) checker) {
    var searchDot = initialDot;
    for (var dot in this) {
      if (checker(dot, searchDot)) {
        searchDot = dot;
      }
    }
    return searchDot;
  }
}
