import 'package:flutter/material.dart';
import 'package:untitled/utils/theme/app_colors/all_colors_export.dart';

class Ripple extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color rippleColor;
  final double rippleRadius;

  const Ripple({
    Key? key,
    this.child,
    required this.onTap,
    this.rippleColor = appPrimaryColor,
    this.rippleRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
