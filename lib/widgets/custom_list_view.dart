import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './custom_task.dart';
import '../constants.dart';
import '../providers/task_provider.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, ch) => taskProvider.getItems.isEmpty
          ? ch!
          : Expanded(
              child: ListView.builder(
                itemCount: taskProvider.getItems.length,
                itemBuilder: (context, index) => CustomTask(task: taskProvider.getItems[index], longPressCallBack: () {
                  taskProvider.deleteTask(taskProvider.getItems[index]);
                }),
              ),
            ),
      child: const Center(
        child: Text(
          'There are no task yet',
          style: TextStyle(fontFamily: fontName, color: Colors.black54),
        ),
      ),
    );
  }
}
