import 'package:flutter/material.dart';
import 'package:untitled/utils/theme/app_colors/all_colors_export.dart';


// ignore: must_be_immutable
class ElevatedContainer extends StatelessWidget  {
  final Widget child;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  ElevatedContainer({
    Key? key,
    required this.child,
    this.bgColor = whiteOnly,
    this.padding,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: child,
    );
  }
}
