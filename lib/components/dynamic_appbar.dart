import 'package:flutter/material.dart';

class DynamicAppBar extends PreferredSize {
  @override
  final Widget child;
  final double height;

  DynamicAppBar({
    required this.height,
    required this.child,
  }) : super(child: child, preferredSize: Size.fromHeight(height));

  @override
  Widget build(BuildContext context) => child;
}