import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/task.dart';

class TaskRemoteDataSource {
  final String baseUrl;
  TaskRemoteDataSource({required this.baseUrl});

  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/tasks'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => Task.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener tareas: ${response.statusCode}');
    }
  }

  Future<Task> createTask(Task task) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tasks'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al crear tarea: ${response.statusCode}');
    }
  }

  Future<Task> updateTask(Task task) async {
    final response = await http.put(
      Uri.parse('$baseUrl/tasks/${task.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(task.toJson()),
    );
    if (response.statusCode == 200) {
      return Task.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al actualizar tarea: ${response.statusCode}');
    }
  }

  Future<void> deleteTask(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/tasks/$id'));
    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Error al eliminar tarea: ${response.statusCode}');
    }
  }
}
