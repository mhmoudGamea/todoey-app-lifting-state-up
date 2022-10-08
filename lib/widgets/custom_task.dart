import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/task.dart';

class CustomTask extends StatelessWidget {
  final Function(bool?) onChangeStatus;
  final Task task;

  CustomTask({super.key, required this.task, required this.onChangeStatus});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
            fontFamily: fontName,
            color: Colors.black54,
            decoration: task.isDone ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: onChangeStatus,
      ),
    );
  }
}
