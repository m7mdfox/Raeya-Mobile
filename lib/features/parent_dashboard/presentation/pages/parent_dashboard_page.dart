import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../cubit/parent_dashboard_cubit.dart';
import '../cubit/parent_dashboard_state.dart';
import '../widgets/emotional_wellbeing_card.dart';
import '../widgets/parent_app_bar.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/safety_alerts_card.dart';
import '../widgets/screen_time_card.dart';

class ParentDashboardPage extends StatelessWidget {
  const ParentDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentDashboardCubit()..loadDashboardData(),
      child: Scaffold(
        backgroundColor: RaeyaColors.background,
        appBar: ParentAppBar(
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
        body: BlocBuilder<ParentDashboardCubit, ParentDashboardState>(
          builder: (context, state) {
            if (state is ParentDashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ParentDashboardError) {
              return Center(child: Text(state.message));
            }

            if (state is ParentDashboardLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Welcome Text
                    const Text(
                      'Good morning, Sarah',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Here's how Leo is doing today.",
                      style: TextStyle(
                        fontSize: 16,
                        color: RaeyaColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Emotional Wellbeing Card
                    EmotionalWellbeingCard(
                      positivePercentage: state.positiveMoodPercentage,
                      stats: state.moods,
                    ),
                    const SizedBox(height: 24),

                    // Screen Time Card
                    ScreenTimeCard(
                      elapsedTime: state.screenTime.elapsedTime,
                      remainingTime: state.screenTime.remainingTime,
                      progress: state.screenTime.progress,
                    ),
                    const SizedBox(height: 32),

                    // Academic Progress Placeholder
                    _SectionHeader(
                      title: 'Academic Progress',
                      actionLabel: 'Weekly View',
                      onActionPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 180,
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
                      child: const Center(
                        child: Text(
                          'Academic Graph Placeholder',
                          style: TextStyle(color: RaeyaColors.textSecondary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Safety Alerts Card
                    SafetyAlertsCard(
                      alerts: state.safetyAlerts,
                    ),
                    const SizedBox(height: 32),

                    // Recommendations Section
                    const Text(
                      'Recommended for Today',
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
                        children: [
                          RecommendationCard(
                            backgroundImage: 'figma-ui/space-background.png',
                            category: 'ACADEMIC BOOST',
                            title: 'Space Exploration',
                            description:
                                'Explore the wonders of the universe through interactive games.',
                            onTap: () {},
                          ),
                          const SizedBox(width: 16),
                          RecommendationCard(
                            backgroundImage: 'figma-ui/Meditation background.png',
                            category: 'WELLNESS',
                            title: 'Mindful Breathing',
                            description:
                                'A quick 5-minute session to help Leo stay calm and focused.',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
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
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String actionLabel;
  final VoidCallback onActionPressed;

  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: RaeyaColors.textPrimary,
          ),
        ),
        TextButton(
          onPressed: onActionPressed,
          child: Text(
            actionLabel,
            style: const TextStyle(
              color: RaeyaColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
