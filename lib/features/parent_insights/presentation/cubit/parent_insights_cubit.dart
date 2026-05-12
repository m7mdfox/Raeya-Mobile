import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/raeya_colors.dart';
import '../../domain/entities/insights_entities.dart';
import 'parent_insights_state.dart';

class ParentInsightsCubit extends Cubit<ParentInsightsState> {
  ParentInsightsCubit() : super(ParentInsightsInitial());

  Future<void> loadInsightsData() async {
    emit(ParentInsightsLoading());

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 800));

      emit(ParentInsightsLoaded(
        joyData: const [
          EmotionalPoint(0, 3),
          EmotionalPoint(1, 4),
          EmotionalPoint(2, 3.5),
          EmotionalPoint(3, 5),
          EmotionalPoint(4, 4.5),
          EmotionalPoint(5, 6),
          EmotionalPoint(6, 5.5),
        ],
        anxietyData: const [
          EmotionalPoint(0, 1),
          EmotionalPoint(1, 1.5),
          EmotionalPoint(2, 1),
          EmotionalPoint(3, 2),
          EmotionalPoint(4, 1.5),
          EmotionalPoint(5, 1),
          EmotionalPoint(6, 0.5),
        ],
        focusData: const [
          EmotionalPoint(0, 4),
          EmotionalPoint(1, 3.5),
          EmotionalPoint(2, 5),
          EmotionalPoint(3, 4),
          EmotionalPoint(4, 5.5),
          EmotionalPoint(5, 5),
          EmotionalPoint(6, 6),
        ],
        dailyInsightTitle: 'Daily Insight',
        dailyInsightBody:
            'Leo has shown a 15% increase in focus during morning creative sessions this week. His joy peaks significantly when engaged in collaborative play.',
        dailyInsightQuote:
            'Maybe try a quiet reading session before bed tonight to maintain this steady pulse.',
        stats: const [
          SummaryStatEntity(
            title: 'Weekly Goal',
            value: '84% Focus',
            icon: Icons.track_changes,
            backgroundColor: Color(0xFFFFD54F),
          ),
          SummaryStatEntity(
            title: 'Top Emotion',
            value: 'High Joy',
            icon: Icons.sentiment_very_satisfied,
            backgroundColor: Color(0xFF90CAF9),
          ),
          SummaryStatEntity(
            title: 'Consistency',
            value: '92% Stable',
            icon: Icons.auto_graph,
            backgroundColor: Colors.white,
          ),
        ],
        activities: const [
          ActivityContextEntity(
            title: 'Creative Play',
            badgeText: 'Peak Joy',
            badgeColor: RaeyaColors.success,
            description: 'Highly engaged in drawing and storytelling activities.',
            progress: 0.9,
            progressColor: RaeyaColors.success,
            imagePath: 'figma-ui/forest-image.png',
          ),
          ActivityContextEntity(
            title: 'Quiet Time',
            badgeText: 'High Focus',
            badgeColor: RaeyaColors.primary,
            description: 'Focused deeply on puzzle solving and quiet reading.',
            progress: 0.75,
            progressColor: RaeyaColors.primary,
            imagePath: 'figma-ui/science-lab.png',
          ),
        ],
      ));
    } catch (e) {
      emit(const ParentInsightsError('Failed to load insights data.'));
    }
  }
}
