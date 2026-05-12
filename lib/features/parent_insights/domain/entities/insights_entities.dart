import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ActivityContextEntity extends Equatable {
  final String title;
  final String badgeText;
  final Color badgeColor;
  final String description;
  final double progress;
  final Color progressColor;
  final String imagePath;

  const ActivityContextEntity({
    required this.title,
    required this.badgeText,
    required this.badgeColor,
    required this.description,
    required this.progress,
    required this.progressColor,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [title, badgeText, badgeColor, description, progress, progressColor, imagePath];
}

class EmotionalPoint extends Equatable {
  final double x;
  final double y;

  const EmotionalPoint(this.x, this.y);

  @override
  List<Object?> get props => [x, y];
}

class SummaryStatEntity extends Equatable {
  final String title;
  final String value;
  final IconData icon;
  final Color backgroundColor;

  const SummaryStatEntity({
    required this.title,
    required this.value,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  List<Object?> get props => [title, value, icon, backgroundColor];
}
