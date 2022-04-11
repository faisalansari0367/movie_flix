import 'package:flutter/widgets.dart';

class BottomMenuItem {
  final IconData iconData;
  final String label, route;
  final Widget page;
  final Key? key;

  const BottomMenuItem(
      {this.key, required this.iconData, required this.label, required this.page, required this.route});
}
