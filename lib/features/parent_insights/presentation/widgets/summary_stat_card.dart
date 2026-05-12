import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class SummaryStatCard extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final String title;
  final String value;

  const SummaryStatCard({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWhiteBackground = backgroundColor == Colors.white;
    final Color contentColor = isWhiteBackground ? RaeyaColors.textPrimary : Colors.white;
    final Color iconBgColor = isWhiteBackground 
        ? RaeyaColors.background 
        : Colors.white.withOpacity(0.3);
    final Color iconColor = isWhiteBackground ? RaeyaColors.primary : Colors.white;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: isWhiteBackground ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ] : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: contentColor.withOpacity(0.7),
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: contentColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
