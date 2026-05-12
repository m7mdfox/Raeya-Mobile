import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

class DailyInsightCard extends StatelessWidget {
  final String insightText;
  final String quoteText;
  final VoidCallback onReadMore;

  const DailyInsightCard({
    super.key,
    required this.insightText,
    required this.quoteText,
    required this.onReadMore,
  });

  @override
  Widget build(BuildContext context) {
    const Color lightGreen = Color(0xFFE8F5E9);
    const Color midGreen = Color(0xFFC8E6C9);
    const Color darkGreen = Color(0xFF2E7D32);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lightbulb_outline,
              color: darkGreen,
              size: 20,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Daily Insight',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: darkGreen,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            insightText,
            style: const TextStyle(
              fontSize: 14,
              color: darkGreen,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: midGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              quoteText,
              style: const TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onReadMore,
              style: ElevatedButton.styleFrom(
                backgroundColor: darkGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'READ MORE TIPS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
