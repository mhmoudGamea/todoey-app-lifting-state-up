import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import '../constants.dart';
import '../models/task.dart';

class CustomTask extends StatelessWidget {
  final Task task;
  final VoidCallback longPressCallBack;

  const CustomTask({super.key, required this.task, required this.longPressCallBack});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        task.name,
        style: TextStyle(
          fontFamily: fontName,
          color: Colors.black54,
          decoration: task.isDone ? TextDecoration.lineThrough : null,
          decorationColor: Colors.red,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: (val) {
          Provider.of<TaskProvider>(context, listen:  false).updateTaskStatus(task);
        },
      ),
    );
  }
}
