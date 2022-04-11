import 'package:flutter/material.dart';

class HandleState extends StatelessWidget {
  final bool isLoading, isEmpty;
  final Widget child;
  const HandleState({
    Key? key,
    this.isLoading = false,
    this.isEmpty = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());
    if (isEmpty) {
      return const Center(child: Text('No records found', style: TextStyle(color: Colors.red, fontSize: 22)));
    }
    return child;
  }
}
