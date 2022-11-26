import 'package:flutter/material.dart';

class InkWellWrapper extends StatelessWidget {
  final Color? color;
  final VoidCallback? onTap;
  final Widget child;
  final BorderRadius borderRadius;
  final Color? splashColor;
  final EdgeInsetsGeometry? padding;
  final Color? highlightColor;
  final Color? hoverColor;

  const InkWellWrapper({
    Key? key,
    this.color,
    this.onTap,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.splashColor = const Color.fromRGBO(102, 102, 102, 0.24),
    this.highlightColor = const Color.fromRGBO(102, 102, 102, 0.24),
    this.hoverColor = const Color.fromRGBO(102, 102, 102, 0.24), this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        color: color,
        padding: padding,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: child,
            highlightColor: highlightColor,
            splashColor: splashColor,
            hoverColor: hoverColor,
          ),
        ),
      ),
    );
  }
}
