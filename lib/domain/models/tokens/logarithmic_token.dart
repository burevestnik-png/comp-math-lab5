import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class LogarithmicToken extends Token {
  LogarithmicToken(double factor) : super(factor);

  LogarithmicToken.basic() : this(1.0);

  @override
  double compute(double x) => factor * log(x);

  @override
  String toString() => "${factor.withSign()} * log(x)";
}
