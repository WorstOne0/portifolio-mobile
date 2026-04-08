import 'package:flutter/material.dart';

import '../styles/app_theme.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.backgroundColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.glass,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? AppColors.glassBorder, width: 1),
      ),
      child: child,
    );
  }
}
