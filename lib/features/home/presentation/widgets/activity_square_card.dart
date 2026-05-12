import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class ActivitySquareCard extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData icon;
  final String? backgroundImagePath;
  final VoidCallback onTap;

  const ActivitySquareCard({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    this.backgroundImagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              if (backgroundImagePath != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      backgroundImagePath!,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: RaeyaColors.textPrimary.withOpacity(0.7),
                      size: 32,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
