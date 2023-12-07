import 'package:demo_app/core/constant/common_colors.dart';
import 'package:flutter/material.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor,
    this.onTap,
    this.style,
  });
  final Icon icon;
  final String title;
  final Color? iconColor;
  final void Function()? onTap;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      iconColor: iconColor ?? CommonColors.deepPurple,
      title: Text(
        title,
        style: style,
      ),
    );
  }
}
