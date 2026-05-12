import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MoodPercentageEntity extends Equatable {
  final String label;
  final double percentage; // 0.0 to 1.0
  final Color color;

  const MoodPercentageEntity({
    required this.label,
    required this.percentage,
    required this.color,
  });

  @override
  List<Object?> get props => [label, percentage, color];
}
