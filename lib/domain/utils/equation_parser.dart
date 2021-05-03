import 'package:comp_math_lab5/domain/dart_api_extension/string.dart';
import 'package:comp_math_lab5/domain/models/equation.dart';

///
/// The code of the parser was taken from
/// https://github.com/Roggired/easy-comp-math
///
class EquationParser {
  int _countOpenBraces(String string) => string.count('(');
  int _countCloseBraces(String string) => string.count(')');

  Equation createEquationFomString(String res) {
    var openBracesQuantity = _countOpenBraces(res);
    var closeBracesQuantity = _countCloseBraces(res);

    if (openBracesQuantity != closeBracesQuantity) {
      throw ArgumentError("Numbers of opened and closed braces is not equal");
    }

    var input = res.trim().replaceAll(" ", "").replaceAll(",", ".");

    return Equation.empty();
  }
}
