class Task {
  final String name;
  late bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }
}