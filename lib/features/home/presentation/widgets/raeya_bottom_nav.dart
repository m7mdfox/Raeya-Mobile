import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class RaeyaBottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const RaeyaBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD), // Light blue pill
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            index: 0,
            isSelected: selectedIndex == 0,
            icon: Icons.face_outlined,
            label: 'Home',
            onTap: () => onItemSelected(0),
          ),
          _NavItem(
            index: 1,
            isSelected: selectedIndex == 1,
            icon: Icons.map_outlined,
            label: 'Learn',
            onTap: () => onItemSelected(1),
          ),
          _NavItem(
            index: 2,
            isSelected: selectedIndex == 2,
            icon: Icons.bar_chart_outlined,
            label: 'Insights',
            onTap: () => onItemSelected(2),
          ),
          _NavItem(
            index: 3,
            isSelected: selectedIndex == 3,
            icon: Icons.health_and_safety_outlined,
            label: 'Safety',
            onTap: () => onItemSelected(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final bool isSelected;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavItem({
    required this.index,
    required this.isSelected,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: isSelected
            ? const BoxDecoration(
                color: RaeyaColors.primary,
                shape: BoxShape.circle,
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : RaeyaColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : RaeyaColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
