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

  void toggleTaskStatus() {
    _isDone = !_isDone;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _items.remove(task);
    notifyListeners();
  }
}