import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenTopadding => MediaQuery.of(this).viewPadding.top;
  double get screenBottom => MediaQuery.of(this).viewInsets.bottom;
}

extension NavigatorHelper on BuildContext {
  void push({required String routeName}) {
    Navigator.pushNamed(this, routeName);
  }

  void pop() {
    Navigator.pop(this);
  }
}
