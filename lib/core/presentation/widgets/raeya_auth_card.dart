import 'package:flutter/material.dart';
import '../../theme/raeya_colors.dart';

class RaeyaAuthCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const RaeyaAuthCard({
    super.key,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: RaeyaColors.surface,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: padding ?? const EdgeInsets.all(32),
      child: child,
    );
  }
}
