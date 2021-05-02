import 'package:flutter/cupertino.dart';

import 'constants.dart';

enum TextSize { LARGE, MEDIUM, SMALL }

Widget fieldText(String content, {TextSize size = TextSize.LARGE}) {
  double fontSize = kFieldLargeFontSize;
  switch (size) {
    case TextSize.MEDIUM:
      fontSize = kFieldMediumFontSize;
      break;
    case TextSize.SMALL:
      fontSize = kFieldSmallFontSize;
      break;
    default:
  }

  return Text(
    content,
    style: TextStyle(fontSize: fontSize),
  );
}
