import 'package:comp_math_lab5/domain/models/tokens/token.dart';
import 'package:fl_chart/fl_chart.dart';

class Equation {
  final List<Token> _tokens;

  Equation(List<Token> _tokens) : _tokens = _tokens;

  double compute(double x) {
    double result = 0.0;
    _tokens.forEach((element) {
      result += element.compute(x);
    });
    return result;
  }

  FlSpot min(
    double from,
    double to, [
    double accuracy = 0.01,
  ]) {
    FlSpot minDot = FlSpot(0, double.infinity);
    for (var i = from; i <= to; i += accuracy) {
      if (minDot.y > compute(i)) {
        minDot = FlSpot(i, _toFixed(compute(i)));
      }
    }
    return minDot;
  }

  FlSpot max(
    double from,
    double to, [
    double accuracy = 0.01,
  ]) {
    FlSpot maxDot = FlSpot(0, double.negativeInfinity);
    for (var i = from; i <= to; i += accuracy) {
      if (maxDot.y < compute(i)) {
        maxDot = FlSpot(i, _toFixed(compute(i)));
      }
    }
    return maxDot;
  }

  double _toFixed(double value, [int digits = 2]) =>
      double.parse(value.toStringAsFixed(digits));

  @override
  String toString() {
    var result = "";

    _tokens.forEach((element) {
      result += element.toString();
    });

    return '$result = 0';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equation &&
          runtimeType == other.runtimeType &&
          _tokens == other._tokens;

  @override
  int get hashCode => _tokens.hashCode;

  bool get isEmpty => _tokens.isEmpty;

  bool get isNotEmpty => _tokens.isNotEmpty;
}
