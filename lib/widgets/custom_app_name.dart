import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task.dart';

import '../providers/task_provider.dart';
import '../constants.dart';

class CustomAppName extends StatelessWidget {
  const CustomAppName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(IconlyBold.category, size: 38, color: Colors.lightBlueAccent),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Todoey',
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: fontName),
          ),
          Consumer<TaskProvider>(
            builder: (context, taskData, child) => Text(
              taskData.getItems.length == 1 ? '${taskData.getItems.length} Task' : '${taskData.getItems.length} Tasks',
              style: const TextStyle(fontSize: 17, color: Colors.white, fontFamily: fontName),
            ),
          ),
        ],
      ),
    );
  }
}