import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class PolynomialToken extends Token {
  final double power;

  PolynomialToken(double factor, this.power) : super(factor);

  @override
  double compute(double x) => factor * pow(x, power);

  @override
  String toString() => '${factor.withSign()} * x^($power)';
}
