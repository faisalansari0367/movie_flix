import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  final int value;
  const Ratings({Key? key, this.value = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Theme.of(context).iconTheme.color,
        );
      }),
    );
  }
}
