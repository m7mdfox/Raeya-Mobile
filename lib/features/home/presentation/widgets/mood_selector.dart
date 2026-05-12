import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../cubit/kid_home_state.dart';

class MoodSelector extends StatelessWidget {
  final KidMood selectedMood;
  final Function(KidMood) onMoodSelected;

  const MoodSelector({
    super.key,
    required this.selectedMood,
    required this.onMoodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'HOW ARE YOU FEELING?',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: RaeyaColors.textSecondary,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: RaeyaColors.lightBlueFill.withOpacity(0.3),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MoodButton(
                emoji: '😊',
                isSelected: selectedMood == KidMood.happy,
                onTap: () => onMoodSelected(KidMood.happy),
              ),
              const SizedBox(width: 16),
              _MoodButton(
                emoji: '😐',
                isSelected: selectedMood == KidMood.neutral,
                onTap: () => onMoodSelected(KidMood.neutral),
              ),
              const SizedBox(width: 16),
              _MoodButton(
                emoji: '😴',
                isSelected: selectedMood == KidMood.sleepy,
                onTap: () => onMoodSelected(KidMood.sleepy),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MoodButton extends StatelessWidget {
  final String emoji;
  final bool isSelected;
  final VoidCallback onTap;

  const _MoodButton({
    required this.emoji,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? RaeyaColors.primary : Colors.white,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: RaeyaColors.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Text(
          emoji,
          style: TextStyle(
            fontSize: 24,
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
