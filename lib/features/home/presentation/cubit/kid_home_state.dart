import 'package:equatable/equatable.dart';

enum KidMood { happy, neutral, sleepy, none }

class KidHomeState extends Equatable {
  final KidMood selectedMood;
  final int currentNavIndex;

  const KidHomeState({
    this.selectedMood = KidMood.none,
    this.currentNavIndex = 0,
  });

  KidHomeState copyWith({
    KidMood? selectedMood,
    int? currentNavIndex,
  }) {
    return KidHomeState(
      selectedMood: selectedMood ?? this.selectedMood,
      currentNavIndex: currentNavIndex ?? this.currentNavIndex,
    );
  }

  @override
  List<Object?> get props => [selectedMood, currentNavIndex];
}
