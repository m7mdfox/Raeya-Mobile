import 'package:equatable/equatable.dart';
import '../../domain/entities/mood_percentage_entity.dart';
import '../../domain/entities/safety_alert_entity.dart';
import '../../domain/entities/screen_time_entity.dart';

abstract class ParentDashboardState extends Equatable {
  const ParentDashboardState();

  @override
  List<Object?> get props => [];
}

class ParentDashboardInitial extends ParentDashboardState {}

class ParentDashboardLoading extends ParentDashboardState {}

class ParentDashboardLoaded extends ParentDashboardState {
  final ScreenTimeEntity screenTime;
  final List<SafetyAlertEntity> safetyAlerts;
  final List<MoodPercentageEntity> moods;
  final double positiveMoodPercentage;

  const ParentDashboardLoaded({
    required this.screenTime,
    required this.safetyAlerts,
    required this.moods,
    required this.positiveMoodPercentage,
  });

  @override
  List<Object?> get props => [screenTime, safetyAlerts, moods, positiveMoodPercentage];
}

class ParentDashboardError extends ParentDashboardState {
  final String message;

  const ParentDashboardError(this.message);

  @override
  List<Object?> get props => [message];
}
