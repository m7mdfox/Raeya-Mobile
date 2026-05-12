import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SafetyAlertEntity extends Equatable {
  final String message;
  final IconData icon;
  final bool isActionRequired;

  const SafetyAlertEntity({
    required this.message,
    required this.icon,
    this.isActionRequired = false,
  });

  @override
  List<Object?> get props => [message, icon, isActionRequired];
}
