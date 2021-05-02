import 'package:comp_math_lab5/domain/models/tokens/token.dart';

class ConstToken extends Token {
  ConstToken(double factor) : super(factor);

  @override
  double compute(double x) => factor;

  @override
  String toString() => factor.withSign();
}
