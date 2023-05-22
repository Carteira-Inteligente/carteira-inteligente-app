import 'package:flutter/material.dart';

class UsersProvider extends InheritedWidget {
  UsersProvider({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
