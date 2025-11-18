import 'package:flutter/foundation.dart';

class Task {
  final String id;
  final String title;
  final bool completed;
  final DateTime updatedAt;
  final bool deleted;

  Task({
    required this.id,
    required this.title,
    required this.completed,
    required this.updatedAt,
    this.deleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as String,
        title: json['title'] as String,
        completed: json['completed'] == true || json['completed'] == 1,
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        deleted: json['deleted'] == true || json['deleted'] == 1,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed ? 1 : 0,
        'updatedAt': updatedAt.toIso8601String(),
        'deleted': deleted ? 1 : 0,
      };

  Task copyWith({
    String? id,
    String? title,
    bool? completed,
    DateTime? updatedAt,
    bool? deleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
    );
  }
}
