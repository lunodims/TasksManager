import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/database_service.dart';
import '../screens/edit_task_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onRefresh;

  const TaskTile({super.key, required this.task, required this.onRefresh});

  void _deleteTask(BuildContext context) async {
    await DatabaseService().deleteTask(task.id!);
    onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _deleteTask(context),
      ),
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditTaskScreen(task: task),
          ),
        );
        onRefresh();
      },
    );
  }
}
