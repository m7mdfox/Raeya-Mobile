import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../parent_dashboard/presentation/widgets/parent_app_bar.dart';
import '../cubit/parent_insights_cubit.dart';
import '../cubit/parent_insights_state.dart';
import '../widgets/activity_context_card.dart';
import '../widgets/daily_insight_card.dart';
import '../widgets/emotional_pulse_chart_card.dart';
import '../widgets/summary_stat_card.dart';

class ParentInsightsPage extends StatelessWidget {
  const ParentInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentInsightsCubit()..loadInsightsData(),
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
        body: BlocBuilder<ParentInsightsCubit, ParentInsightsState>(
          builder: (context, state) {
            if (state is ParentInsightsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ParentInsightsError) {
              return Center(child: Text(state.message));
            }

            if (state is ParentInsightsLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Header Title
                    const Text(
                      'Insights',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Emotional and behavioral trends for Leo',
                      style: TextStyle(
                        fontSize: 16,
                        color: RaeyaColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Chart Section
                    const EmotionalPulseChartCard(),
                    const SizedBox(height: 32),

                    // Daily Insight Section
                    DailyInsightCard(
                      insightText: state.dailyInsightBody,
                      quoteText: '"${state.dailyInsightQuote}"',
                      onReadMore: () {},
                    ),
                    const SizedBox(height: 32),

                    // Stats Section
                    ...state.stats.map((stat) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SummaryStatCard(
                            backgroundColor: stat.backgroundColor,
                            icon: stat.icon,
                            title: stat.title,
                            value: stat.value,
                          ),
                        )),

                    const SizedBox(height: 16),

                    // Activity Context Section
                    const Text(
                      'Activity Context',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: RaeyaColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...state.activities.map((activity) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ActivityContextCard(
                            imagePath: activity.imagePath,
                            title: activity.title,
                            badgeText: activity.badgeText,
                            badgeColor: activity.badgeColor,
                            description: activity.description,
                            progress: activity.progress,
                            progressColor: activity.progressColor,
                          ),
                        )),
                    const SizedBox(height: 24),
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
