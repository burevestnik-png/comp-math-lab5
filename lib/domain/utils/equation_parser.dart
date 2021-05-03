import 'dart:math';

import 'package:comp_math_lab5/domain/dart_api_extension/string.dart';
import 'package:comp_math_lab5/domain/models/equation.dart';
import 'package:comp_math_lab5/domain/models/tokens/const_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/polynomial_token.dart';
import 'package:comp_math_lab5/domain/models/tokens/token.dart';
import 'package:comp_math_lab5/domain/models/tokens/trigonometric_token.dart';

///
/// The code of the parser was taken from
/// https://github.com/Roggired/easy-comp-math
///
class EquationParser {
  final numRegexp = RegExp(r"\d+(\.\d+)?");

  int _countOpenBraces(String string) => string.count('(');

  int _countCloseBraces(String string) => string.count(')');

  Equation createEquationFomString(String src) {
    var openBracesQuantity = _countOpenBraces(src);
    var closeBracesQuantity = _countCloseBraces(src);

    if (openBracesQuantity != closeBracesQuantity) {
      throw ArgumentError("Numbers of opened and closed braces is not equal");
    }

    var input = src.trim().replaceAll(" ", "").replaceAll(",", ".");
    var tokens = <Token>[];

    int openedBraces = 0;
    String token = "";

    for (var char in input.split("")) {
      if (char == '(') {
        openedBraces++;
      } else if (char == ')') {
        openedBraces--;
      } else if (char == '+' || char == '-') {
        if (openedBraces == 0 &&
            token.isNotEmpty &&
            token.substring(token.length - 1) != '^') {
          tokens.add(_parseToken(token));
          token = "";
        }
      }

      token += char;
    }

    tokens.add(_parseToken(token));

    return Equation(tokens);
  }

  Token _parseToken(String token) {
    var factors = numRegexp.allMatches(token);
    if (factors.length <= 0 && factors.length > 2) {
      throw ArgumentError("Illegal token input");
    }

    final firstArg = double.tryParse(factors.toList()[0].group(0)!)!;
    final secondArg = double.tryParse(factors.toList()[1].group(0)!)!;

    if (token.contains("sin")) {
      return TrigonometricToken(firstArg, "sin", sin, secondArg);
    }

    if (factors.length == 2) {
      return PolynomialToken(firstArg, secondArg);
    } else {
      return ConstToken(firstArg);
    }
  }
}
