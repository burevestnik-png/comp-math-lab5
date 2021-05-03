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

  @override
  double compute(double x) => factor * function(argFactor * x);

  @override
  String toString() => "${factor.withSign()} * $functionName($argFactor * x)";
}
