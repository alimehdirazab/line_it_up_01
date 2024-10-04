part of 'generics.dart';

extension NavigationExtension on BuildContext {
  void pushPage(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushReplacementPage(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushAndRemoveUntilPage(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void popUntilPage(Widget page) {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }

  void popPage() {
    Navigator.of(this).pop();
  }
}

extension MediaQueryValues on BuildContext {
  double get mWidth => MediaQuery.of(this).size.width;
  double get mHeight => MediaQuery.of(this).size.height;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
