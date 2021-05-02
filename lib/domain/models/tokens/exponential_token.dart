import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class ExponentialToken extends Token {
  final double _power;

  ExponentialToken(double factor, this._power) : super(factor);

  @override
  double compute(double x) => factor * pow(e, _power * x).toDouble();

  @override
  String toString() => "${factor.withSign()} * e^($_power * x)";
}
