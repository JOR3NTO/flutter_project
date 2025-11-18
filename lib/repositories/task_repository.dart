import '../models/task.dart';
import '../data/local/task_local_data_source.dart';
import '../data/remote/task_remote_data_source.dart';

class TaskRepository {
  final TaskLocalDataSource local;
  final TaskRemoteDataSource remote;

  TaskRepository({required this.local, required this.remote});

  Future<List<Task>> getTasks({bool refresh = false}) async {
    // Solo funcionamiento local para pruebas
    return await local.getAllTasks();
  }

  Future<void> addTask(Task task) async {
    await local.insertTask(task);
  }

  Future<void> updateTask(Task task) async {
    await local.updateTask(task);
  }

  Future<void> deleteTask(String id) async {
    await local.deleteTask(id);
  }
}
