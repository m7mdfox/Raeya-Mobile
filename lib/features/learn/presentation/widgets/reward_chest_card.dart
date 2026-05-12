import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class RewardChestCard extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String subtitle;

  const RewardChestCard({
    super.key,
    required this.progress,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD54F),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reward Chest',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D4037),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF8D6E63),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.card_giftcard,
                color: Color(0xFFFFD54F),
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              Transform.translate(
                offset: const Offset(10, 0),
                child: const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
