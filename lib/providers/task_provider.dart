import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends ChangeNotifier {
  final TaskRepository repository;
  List<Task> _tasks = [];
  bool _loading = false;
  String? _error;
  String _filter = 'all'; // all, completed, pending

  TaskProvider({required this.repository});

  List<Task> get tasks {
    switch (_filter) {
      case 'completed':
        return _tasks.where((t) => t.completed && !t.deleted).toList();
      case 'pending':
        return _tasks.where((t) => !t.completed && !t.deleted).toList();
      default:
        return _tasks.where((t) => !t.deleted).toList();
    }
  }
  bool get loading => _loading;
  String? get error => _error;
  String get filter => _filter;

  Future<void> loadTasks({bool refresh = false}) async {
    _loading = true;
    notifyListeners();
    try {
      _tasks = await repository.getTasks(refresh: refresh);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final task = Task(
      id: const Uuid().v4(),
      title: title,
      completed: false,
      updatedAt: DateTime.now(),
    );
    await repository.addTask(task);
    await loadTasks();
  }

  Future<void> toggleTask(Task task) async {
    final updated = task.copyWith(
      completed: !task.completed,
      updatedAt: DateTime.now(),
    );
    await repository.updateTask(updated);
    await loadTasks();
  }

  Future<void> deleteTask(Task task) async {
    await repository.deleteTask(task.id);
    await loadTasks();
  }

  void setFilter(String filter) {
    _filter = filter;
    notifyListeners();
  }
}
