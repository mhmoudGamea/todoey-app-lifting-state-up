import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  bool _isDone = false;
  final List<Task> _items = [];

  bool get getStatus {
    return _isDone;
  }

  List<Task> get getItems {
    return [..._items];
  }

  void addTask(String newTask) {
    _items.add(Task(name: newTask, isDone: false));
    notifyListeners();
  }

  void updateTaskStatus(Task task) {
    task.toggleStatus();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _items.remove(task);
    notifyListeners();
  }
}