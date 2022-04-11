import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon, suffixIcon;
  final Color? fillColor;
  final void Function(String)? onSubmitted;
  const MyTextField({
    Key? key,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onSubmitted,
    this.fillColor, this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: theme.textTheme.bodyText2,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? theme.inputDecorationTheme.fillColor,
        hintText: hintText,
    
        hintStyle: TextStyle(color: theme.textTheme.bodyText1!.color),
        filled: true,
    
        focusColor: theme.iconTheme.color,
        enabledBorder: kInputBorder,
        focusedBorder: kInputBorder,
        border: kInputBorder,
        // contentPadding: EdgeInsets.only(left: .padding),
      ),
    );
  }
}
