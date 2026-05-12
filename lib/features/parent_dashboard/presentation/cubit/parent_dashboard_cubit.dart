import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/mood_percentage_entity.dart';
import '../../domain/entities/safety_alert_entity.dart';
import '../../domain/entities/screen_time_entity.dart';
import 'parent_dashboard_state.dart';

class ParentDashboardCubit extends Cubit<ParentDashboardState> {
  ParentDashboardCubit() : super(ParentDashboardInitial());

  Future<void> loadDashboardData() async {
    emit(ParentDashboardLoading());

    // Simulate a brief delay to mimic network request
    await Future.delayed(const Duration(seconds: 1));

    try {
      final screenTime = const ScreenTimeEntity(
        elapsedTime: '01:42',
        remainingTime: '18m',
        progress: 0.85,
      );

      final safetyAlerts = [
        const SafetyAlertEntity(
          message: 'Flagged content in Chat',
          icon: Icons.warning_amber_rounded,
          isActionRequired: true,
        ),
        const SafetyAlertEntity(
          message: 'Unknown app access',
          icon: Icons.shield_outlined,
          isActionRequired: false,
        ),
      ];

      final moods = [
        const MoodPercentageEntity(label: 'Happy', percentage: 0.45, color: Colors.orange),
        const MoodPercentageEntity(label: 'Focused', percentage: 0.30, color: Colors.blue),
        const MoodPercentageEntity(label: 'Anxious', percentage: 0.15, color: Colors.purple),
        const MoodPercentageEntity(label: 'Tired', percentage: 0.10, color: Colors.grey),
      ];

      emit(ParentDashboardLoaded(
        screenTime: screenTime,
        safetyAlerts: safetyAlerts,
        moods: moods,
        positiveMoodPercentage: 0.75,
      ));
    } catch (e) {
      emit(const ParentDashboardError('Failed to load dashboard data'));
    }
  }
}
