abstract class Token {
  final double _factor;

  Token(this._factor);

  double compute(double x);

  double get factor => _factor;
  double get sign => _factor.sign;
}

extension WithSign on double {
  String withSign() {
    if (this.sign == 1) {
      return " + $this";
    } else if (this.sign == -1) {
      return " - ${this * -1}";
    } else {
      return "$this";
    }
  }
}
