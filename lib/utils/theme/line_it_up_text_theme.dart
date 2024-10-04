part of 'theme.dart';

class LineItUpTextTheme {
  LineItUpTextTheme({
    this.fontFamily = "Inter",
  }) : _baseTextStyle = TextStyle(
          fontFamily: fontFamily,
          fontWeight: LineItUpFontWeight.regular,
          letterSpacing: 0.8,
          height: 1.15,
        );

  final String fontFamily;
  final TextStyle _baseTextStyle;

  TextStyle get heading => _baseTextStyle.copyWith(
        fontSize: 24,
        fontWeight: LineItUpFontWeight.semiBold,
        color: LineItUpColorTheme().black,
      );

  TextStyle get body => _baseTextStyle.copyWith(
        fontSize: 16,
        fontWeight: LineItUpFontWeight.medium,
        color: LineItUpColorTheme().black,
      );

  TextStyle get light => _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: LineItUpFontWeight.regular,
        color: LineItUpColorTheme().white,
      );
}

extension LineItUpFontWeight on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}
