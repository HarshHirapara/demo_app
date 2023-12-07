import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.color,
    this.thickness,
  });
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          left: left ?? 0,
          right: right ?? 0),
      child: Divider(
        thickness: thickness,
        color: color,
      ),
    );
  }
}
