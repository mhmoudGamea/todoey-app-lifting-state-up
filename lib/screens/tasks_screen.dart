import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../models/task.dart';
import '../widgets/custom_app_name.dart';
import '../widgets/custom_task.dart';
import './add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> items = [
    Task(name: 'Go Gym'),
    Task(name: 'Bye bread'),
    Task(name: 'Bye tomatoes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppName(numberOfTasks: items.length),
          Expanded(
            // the bottom white container
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CustomListView(items: items)
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(context:(context) , builder: (context) =>  AddTaskScreen(addNewTaskFunction: (value) {
            setState(() {
              items.add(Task(name: value!));
            });
          }));
        },
        child: const Icon(IconlyBold.plus),
      ),
    );
  }
}


class CustomListView extends StatefulWidget {

  final List<Task> items;

  const CustomListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) => CustomTask(task: widget.items[index], onChangeStatus: (value) {
          setState(() {
            widget.items[index].isDone = value!;
          });
        }),
      ),
    );
  }
}


