import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class LinearToken extends Token {
  LinearToken(double factor) : super(factor);

  LinearToken.basic() : this(1.0);

  @override
  double compute(double x) => factor * x;

  @override
  String toString() => '${factor.withSign()} * x';
}
