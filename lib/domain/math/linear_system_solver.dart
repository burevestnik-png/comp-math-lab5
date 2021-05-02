import 'package:comp_math_lab5/domain/dart_api_extension/collections.dart';

class LinearSystemSolver {
  static List<double>? compute(
    List<List<double>> matrix,
    List<double> resultsVector,
  ) {
    var results = List<double>.filled(matrix.length, 0);
    for (var i = 0; i < matrix.length; i++) {
      var max = i;
      for (var j = i + 1; j < matrix.length; j++) {
        if (matrix[j][i].abs() > matrix[max][i]) max = j;
      }

      matrix.swap(i, max);
      resultsVector.swap(i, max);

      if (matrix[i][i].abs() <= 1e-10) return null;

      for (var j = i + 1; j < matrix.length; j++) {
        var alpha = matrix[j][i] / matrix[i][i];
        resultsVector[j] -= alpha * resultsVector[i];
        for (var n = i; n < matrix.length; n++) {
          matrix[j][n] -= alpha * matrix[i][n];
        }
      }

      for (var i = matrix.length - 1; i >= 0; i--) {
        var sum = 0.0;
        for (var j = i + 1; j < matrix.length; j++) {
          sum += matrix[i][j] * results[j];
        }
        results[i] = (resultsVector[i] - sum) / matrix[i][i];
      }
    }

    return results;
  }
}
