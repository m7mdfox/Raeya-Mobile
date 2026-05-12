import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../home/presentation/widgets/kid_app_bar.dart';
import '../cubit/learning_world_cubit.dart';
import '../cubit/learning_world_state.dart';
import '../widgets/achievement_badge_card.dart';
import '../widgets/daily_quest_card.dart';
import '../widgets/learning_world_card.dart';
import '../widgets/reward_chest_card.dart';
import '../widgets/user_stats_pill.dart';

class LearningWorldPage extends StatelessWidget {
  const LearningWorldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningWorldCubit()..loadLearningData(),
      child: Scaffold(
        backgroundColor: RaeyaColors.background,
        appBar: KidAppBar(
          userName: 'Sarah',
          onSettingsPressed: () {},
          onLogout: () {
            context.read<LoginCubit>().logout();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          },
        ),
        body: BlocBuilder<LearningWorldCubit, LearningWorldState>(
          builder: (context, state) {
            if (state is LearningWorldLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is LearningWorldError) {
              return Center(child: Text(state.message));
            }

            if (state is LearningWorldLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Welcome Section
                    const Text(
                      'Welcome back,\nLeo!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.primary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your next adventure is waiting in the Reading Forest. Ready to earn more stars?',
                      style: TextStyle(
                        fontSize: 14,
                        color: RaeyaColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Stats Section
                    UserStatsPill(stars: state.stars, medals: state.medals),
                    const SizedBox(height: 32),
                    // Daily Quest Section
                    DailyQuestCard(
                      title: 'The Daily Quiz\nChallenge',
                      description: 'Complete 5 quick riddles to unlock today’s mysterious reward!',
                      backgroundImage: 'figma-ui/space-background.png',
                      onPlayPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    // Reward Chest Section
                    RewardChestCard(
                      progress: state.chestProgress,
                      subtitle: 'You are 3 stars away from unlocking a new character outfit!',
                    ),
                    const SizedBox(height: 32),
                    // Worlds Section
                    ...state.availableWorlds.map((world) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: LearningWorldCard(
                          imagePath: world.imagePath,
                          title: world.title,
                          subtitle: world.subtitle,
                          themeColor: world.category == 'science' ? Colors.green : RaeyaColors.primary,
                          icon: world.category == 'science' ? Icons.science_outlined : Icons.menu_book_outlined,
                          buttonText: world.category == 'science' ? 'Explore' : 'Continue',
                          onPressed: () {},
                          progressWidget: world.category == 'science' ? _buildScienceDots() : _buildReadingProgressBar(),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 8),
                    // Achievements Section
                    const Text(
                      'Recent Achievements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: state.recentAchievements.map((achievement) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: AchievementBadgeCard(
                              icon: achievement.icon,
                              iconBackgroundColor: achievement.color,
                              title: achievement.title,
                              subtitle: achievement.subtitle,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 100), // Space for FAB
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildScienceDots() {
    return Row(
      children: [
        _dot(RaeyaColors.primary),
        _dot(Colors.green),
        _dot(Colors.orange),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '+12',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _dot(Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }

  Widget _buildReadingProgressBar() {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.4,
              minHeight: 8,
              backgroundColor: RaeyaColors.primary.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(RaeyaColors.primary),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'Level 4',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: RaeyaColors.primary,
          ),
        ),
      ],
    );
  }
}
