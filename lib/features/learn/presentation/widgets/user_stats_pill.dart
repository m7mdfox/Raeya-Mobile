import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class UserStatsPill extends StatelessWidget {
  final int stars;
  final int medals;

  const UserStatsPill({
    super.key,
    required this.stars,
    required this.medals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatItem(
            value: '$stars',
            label: 'STARS',
            icon: Icons.stars,
            iconColor: Colors.orange,
          ),
          Container(
            height: 30,
            width: 1,
            color: RaeyaColors.border,
          ),
          _StatItem(
            value: '$medals',
            label: 'MEDALS',
            icon: Icons.emoji_events,
            iconColor: Colors.green,
          ),
          Container(
            height: 30,
            width: 1,
            color: RaeyaColors.border,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.inventory_2,
              color: Colors.brown,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color iconColor;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: RaeyaColors.textPrimary,
              ),
            ),
            Row(
              children: [
                Icon(icon, size: 12, color: iconColor),
                const SizedBox(width: 4),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: RaeyaColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
