import 'package:flutter/cupertino.dart';

class Themes {
  static const BoxDecoration kDefaultRoundedBorderDecoration = BoxDecoration(
    color: CupertinoDynamicColor.withBrightness(
      color: CupertinoColors.white,
      darkColor: CupertinoColors.black,
    ),
    border: Border(
      top: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      bottom: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      left: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      right: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );

  static const TextStyle kDefaultTextStyleForCupertinoTextFiled = TextStyle(
    color: CupertinoDynamicColor.withBrightness(
      color: CupertinoColors.black,
      darkColor: CupertinoColors.white,
    ),
  );
}
