import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class PowerToken extends Token {
  final double _power;

  PowerToken(double factor, this._power) : super(factor);

  @override
  double compute(double x) => factor * pow(x, _power);

  @override
  String toString() => "${factor.withSign()} * x^($_power)";
}
