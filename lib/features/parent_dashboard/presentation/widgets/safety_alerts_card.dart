import 'package:flutter/material.dart';
import '../../../../core/theme/raeya_colors.dart';

import '../../domain/entities/safety_alert_entity.dart';

class SafetyAlertsCard extends StatelessWidget {
  final List<SafetyAlertEntity> alerts;

  const SafetyAlertsCard({
    super.key,
    required this.alerts,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Safety Alerts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: RaeyaColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (alerts.any((alert) => alert.isActionRequired))
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: RaeyaColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'ACTION REQUIRED',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: RaeyaColors.error,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: alerts.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final alert = alerts[index];
              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: alert.isActionRequired 
                          ? RaeyaColors.error.withOpacity(0.1) 
                          : RaeyaColors.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      alert.icon,
                      size: 20,
                      color: alert.isActionRequired ? RaeyaColors.error : RaeyaColors.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      alert.message,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: RaeyaColors.textPrimary,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: RaeyaColors.textSecondary,
                    size: 20,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
