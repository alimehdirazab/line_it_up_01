import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'line_it_up_color_theme.dart';
part 'line_it_up_text_theme.dart';
part 'line_it_up_icons.dart';

class LineItUpTheme {
  final LineItUpColorTheme _lineItUpColorTheme;
  final LineItUpTextTheme _lineItUpTextTheme;

  LineItUpTheme({
    LineItUpColorTheme? lineItUpColorTheme,
    LineItUpTextTheme? lineItUpTextTheme,
  })  : _lineItUpTextTheme = lineItUpTextTheme ?? LineItUpTextTheme(),
        _lineItUpColorTheme = lineItUpColorTheme ?? LineItUpColorTheme();

  ThemeData get data => ThemeData(
        useMaterial3: true,
        primaryColor: _lineItUpColorTheme.primary,
        fontFamily: _lineItUpTextTheme.fontFamily,
        colorScheme: colorScheme,
        textTheme: textThemeData,
        inputDecorationTheme: inputDecorationThemeData,
        iconTheme: iconThemeData,
        listTileTheme: listTileThemeData,
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: _lineItUpColorTheme.background,
        elevatedButtonTheme: elevatedButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
        dividerTheme: dividerTheme,
        datePickerTheme: datePickerTheme,
      );

  ColorScheme get colorScheme => const ColorScheme.light().copyWith(
        primary: _lineItUpColorTheme.primary,
        secondary: _lineItUpColorTheme.secondary,
        //surface: _lineItUpColorTheme.black,
        surfaceTint: Colors.transparent,
      );

  TextTheme get textThemeData => TextTheme(
        bodyLarge: _lineItUpTextTheme.body,
        titleMedium: _lineItUpTextTheme.light,
      );

  IconThemeData get iconThemeData => IconThemeData(
        color: _lineItUpColorTheme.primary,
      );

  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      );

  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      );

  ListTileThemeData get listTileThemeData => ListTileThemeData(
        iconColor: _lineItUpColorTheme.primary,
      );

  InputDecorationTheme get inputDecorationThemeData => InputDecorationTheme(
        iconColor: _lineItUpColorTheme.primary,
        hintStyle: _lineItUpTextTheme.body.copyWith(
          color: _lineItUpColorTheme.secondary,
        ),
        labelStyle: _lineItUpTextTheme.body,
      );

  AppBarTheme get appBarTheme => const AppBarTheme(
        backgroundColor: Colors.transparent,
        //foregroundColor: _lineItUpColorTheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
      );

  DividerThemeData get dividerTheme => DividerThemeData(
        color: _lineItUpColorTheme.grey30,
        space: 0,
        thickness: 1,
      );

  DatePickerThemeData get datePickerTheme => DatePickerThemeData(
        backgroundColor: _lineItUpColorTheme.white,
      );
}
