import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';
import '../../models/task.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Regresar al menú principal',
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          PopupMenuButton<String>(
            onSelected: provider.setFilter,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('Todas')),
              const PopupMenuItem(value: 'pending', child: Text('Pendientes')),
              const PopupMenuItem(value: 'completed', child: Text('Completadas')),
            ],
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: provider.loading
          ? const Center(child: CircularProgressIndicator())
          : provider.error != null
              ? Center(child: Text('Error: ${provider.error}'))
              : ListView.builder(
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, i) {
                    final task = provider.tasks[i];
                    return ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration: task.completed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: task.completed,
                        onChanged: (_) => provider.toggleTask(task),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => provider.deleteTask(task),
                      ),
                      onTap: () => provider.toggleTask(task),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await showDialog<String>(
            context: context,
            builder: (context) => const _AddTaskDialog(),
          );
          if (title != null && title.trim().isNotEmpty) {
            provider.addTask(title.trim());
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Nueva tarea',
      ),
    );
  }
}

class _AddTaskDialog extends StatefulWidget {
  const _AddTaskDialog();
  @override
  State<_AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<_AddTaskDialog> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nueva tarea'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(hintText: 'Título de la tarea'),
        onSubmitted: (v) => Navigator.of(context).pop(v),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
