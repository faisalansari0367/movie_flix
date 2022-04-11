import 'package:flutter/material.dart';

import 'change_theme_button.dart';
import 'my_text_field.dart';

class TextFieldWithChangeTheme extends StatelessWidget {
  const TextFieldWithChangeTheme({
    Key? key,
    this.controller,
    this.onChanged,
    this.clearQuery,
    this.query,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? clearQuery;

  final String? query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Flexible(
          flex: 8,
          child: MyTextField(
            hintText: 'Search...',
            controller: controller,
            onChanged: onChanged,
            prefixIcon: Icon(
              Icons.search,
              color: theme.iconTheme.color,
            ),
            suffixIcon: query?.isNotEmpty ?? false
                ? IconButton(onPressed: clearQuery, icon: Icon(Icons.clear, color: theme.iconTheme.color))
                : null,
          ),
        ),
        const Flexible(
          flex: 1,
          child: ChangeThemeIcon(),
        )
      ],
    );
  }
}
