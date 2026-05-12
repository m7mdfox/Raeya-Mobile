import 'package:equatable/equatable.dart';

class ScreenTimeEntity extends Equatable {
  final String elapsedTime;
  final String remainingTime;
  final double progress; // 0.0 to 1.0

  const ScreenTimeEntity({
    required this.elapsedTime,
    required this.remainingTime,
    required this.progress,
  });

  @override
  List<Object?> get props => [elapsedTime, remainingTime, progress];
}
