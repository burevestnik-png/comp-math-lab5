import 'dart:math';

import 'package:comp_math_lab5/domain/models/tokens/linear_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/logarithmic_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class PolynomialToken extends Token {
  final Token _token;
  final double _power;

  PolynomialToken(this._token, this._power, double factor) : super(factor);

  PolynomialToken.basicPos({
    required double power,
    required double factor,
  }) : this(LinearToken.basic(), power, factor);

  PolynomialToken.basicNeg({
    required double power,
    required double factor,
  }) : this(LinearToken.basic(), power, factor * (-1));

  PolynomialToken.logarithmic(double factor)
      : this(LogarithmicToken.basic(), 1.0, factor);

  @override
  double compute(double x) => factor * pow(_token.compute(x), _power);

  @override
  String toString() => '${factor.withSign()} * ($_token)^$_power';
}
