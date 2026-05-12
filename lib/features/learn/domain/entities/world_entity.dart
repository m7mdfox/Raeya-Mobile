import 'package:equatable/equatable.dart';

class WorldEntity extends Equatable {
  final String title;
  final String subtitle;
  final String imagePath;
  final String category; // 'science' or 'reading'

  const WorldEntity({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.category,
  });

  @override
  List<Object?> get props => [title, subtitle, imagePath, category];
}
