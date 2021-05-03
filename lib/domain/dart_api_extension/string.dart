extension Count on String {
  int count(String char) => char.allMatches(this).length;
}
