import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../../auth/presentation/cubit/login_cubit.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../cubit/kid_home_cubit.dart';
import '../cubit/kid_home_state.dart';
import '../widgets/activity_square_card.dart';
import '../widgets/daily_challenge_card.dart';
import '../widgets/kid_app_bar.dart';
import '../widgets/mood_selector.dart';
import '../widgets/talk_action_card.dart';

class KidHomePage extends StatelessWidget {
  const KidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KidHomeCubit(),
      child: BlocBuilder<KidHomeCubit, KidHomeState>(
        builder: (context, state) {
          return Scaffold(
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
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Hero Section with Elephant and Chat Bubble
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Image.asset(
                          'figma-ui/elephant.png',
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Positioned(
                        top: 0,
                        right: 20,
                        child: _ChatBubble(text: 'Hi, Leo! 👋'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Headline
                  const Text(
                    'Ready for an adventure today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: RaeyaColors.textPrimary,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Mood Selector
                  MoodSelector(
                    selectedMood: state.selectedMood,
                    onMoodSelected: (mood) {
                      context.read<KidHomeCubit>().selectMood(mood);
                    },
                  ),
                  const SizedBox(height: 32),
                  // Talk Action Card
                  TalkActionCard(onTap: () {}),
                  const SizedBox(height: 24),
                  // Activities Row
                  Row(
                    children: [
                      ActivitySquareCard(
                        backgroundColor: const Color(0xFFFFE082),
                        title: "Today's\nStory",
                        icon: Icons.menu_book,
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      ActivitySquareCard(
                        backgroundColor: const Color(0xFFA5D6A7),
                        title: "Learning\nWorld",
                        icon: Icons.public,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Daily Challenge Card
                  DailyChallengeCard(
                    title: 'Daily Challenge',
                    subtitle: 'Draw a happy tree!',
                    icon: Icons.rocket_launch,
                    onTap: () {},
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;

  const _ChatBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: RaeyaColors.primary,
        ),
      ),
    );
  }
}
