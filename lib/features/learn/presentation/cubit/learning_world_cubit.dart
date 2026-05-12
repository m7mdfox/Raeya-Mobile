import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../domain/entities/achievement_entity.dart';
import '../../domain/entities/world_entity.dart';
import 'learning_world_state.dart';

class LearningWorldCubit extends Cubit<LearningWorldState> {
  LearningWorldCubit() : super(LearningWorldInitial());

  Future<void> loadLearningData() async {
    emit(LearningWorldLoading());

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    try {
      final worlds = [
        const WorldEntity(
          title: 'Science Island',
          subtitle: 'Discover the secrets of the tiny world.',
          imagePath: 'figma-ui/science-lab.png',
          category: 'science',
        ),
        const WorldEntity(
          title: 'Reading Forest',
          subtitle: 'Embark on a journey through 100 stories.',
          imagePath: 'figma-ui/forest-image.png',
          category: 'reading',
        ),
      ];

      final achievements = [
        const AchievementEntity(
          title: 'Early Bird',
          subtitle: 'Completed quiz before 8 AM',
          icon: Icons.wb_sunny_outlined,
          color: Colors.green,
        ),
        const AchievementEntity(
          title: 'Space Explorer',
          subtitle: 'Science module finished',
          icon: Icons.rocket_launch_outlined,
          color: RaeyaColors.primary,
        ),
        const AchievementEntity(
          title: 'Super Star',
          subtitle: '10 day login streak',
          icon: Icons.auto_awesome_outlined,
          color: Colors.orange,
        ),
      ];

      emit(LearningWorldLoaded(
        stars: 124,
        medals: 12,
        chestProgress: 0.75,
        availableWorlds: worlds,
        recentAchievements: achievements,
      ));
    } catch (e) {
      emit(const LearningWorldError('Failed to load learning data'));
    }
  }
}
