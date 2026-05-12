import 'package:equatable/equatable.dart';
import '../../domain/entities/insights_entities.dart';

abstract class ParentInsightsState extends Equatable {
  const ParentInsightsState();

  @override
  List<Object?> get props => [];
}

class ParentInsightsInitial extends ParentInsightsState {}

class ParentInsightsLoading extends ParentInsightsState {}

class ParentInsightsLoaded extends ParentInsightsState {
  final List<EmotionalPoint> joyData;
  final List<EmotionalPoint> anxietyData;
  final List<EmotionalPoint> focusData;
  final String dailyInsightTitle;
  final String dailyInsightBody;
  final String dailyInsightQuote;
  final List<SummaryStatEntity> stats;
  final List<ActivityContextEntity> activities;

  const ParentInsightsLoaded({
    required this.joyData,
    required this.anxietyData,
    required this.focusData,
    required this.dailyInsightTitle,
    required this.dailyInsightBody,
    required this.dailyInsightQuote,
    required this.stats,
    required this.activities,
  });

  @override
  List<Object?> get props => [
        joyData,
        anxietyData,
        focusData,
        dailyInsightTitle,
        dailyInsightBody,
        dailyInsightQuote,
        stats,
        activities,
      ];
}

class ParentInsightsError extends ParentInsightsState {
  final String message;

  const ParentInsightsError(this.message);

  @override
  List<Object?> get props => [message];
}
