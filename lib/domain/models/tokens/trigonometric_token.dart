import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class TrigonometricToken extends Token {
  final String functionName;
  final double Function(double) function;
  final double argFactor;

  TrigonometricToken(
    double factor,
    this.functionName,
    this.function,
    this.argFactor,
  ) : super(factor);

  TrigonometricToken.sin(
    double factor,
    double argFactor,
  ) : this(factor, "sin", sin, argFactor);

  @override
  double compute(double x) => factor * function(argFactor * x);

  @override
  String toString() => "${factor.withSign()} * $functionName($argFactor * x)";
}
