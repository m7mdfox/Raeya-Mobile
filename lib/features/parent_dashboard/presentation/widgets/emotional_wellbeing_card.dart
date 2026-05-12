import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

import '../../domain/entities/mood_percentage_entity.dart';

class EmotionalWellbeingCard extends StatelessWidget {
  final double positivePercentage;
  final List<MoodPercentageEntity> stats;

  const EmotionalWellbeingCard({
    super.key,
    required this.positivePercentage,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Emotional Wellbeing',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: RaeyaColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              // Donut Chart
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: positivePercentage,
                      strokeWidth: 12,
                      backgroundColor: RaeyaColors.background,
                      valueColor: const AlwaysStoppedAnimation<Color>(RaeyaColors.success),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${(positivePercentage * 100).toInt()}%',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: RaeyaColors.success,
                        ),
                      ),
                      const Text(
                        'POSITIVE',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: RaeyaColors.success,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 32),
              // Stats Grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5,
                  children: stats.map((stat) => _StatChip(stat: stat)).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final MoodPercentageEntity stat;

  const _StatChip({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: RaeyaColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: stat.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              stat.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: RaeyaColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
