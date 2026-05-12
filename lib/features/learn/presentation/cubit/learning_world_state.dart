import 'package:equatable/equatable.dart';
import '../../domain/entities/achievement_entity.dart';
import '../../domain/entities/world_entity.dart';

abstract class LearningWorldState extends Equatable {
  const LearningWorldState();

  @override
  List<Object?> get props => [];
}

class LearningWorldInitial extends LearningWorldState {}

class LearningWorldLoading extends LearningWorldState {}

class LearningWorldLoaded extends LearningWorldState {
  final int stars;
  final int medals;
  final double chestProgress;
  final List<WorldEntity> availableWorlds;
  final List<AchievementEntity> recentAchievements;

  const LearningWorldLoaded({
    required this.stars,
    required this.medals,
    required this.chestProgress,
    required this.availableWorlds,
    required this.recentAchievements,
  });

  @override
  List<Object?> get props => [
        stars,
        medals,
        chestProgress,
        availableWorlds,
        recentAchievements,
      ];
}

class LearningWorldError extends LearningWorldState {
  final String message;

  const LearningWorldError(this.message);

  @override
  List<Object?> get props => [message];
}
