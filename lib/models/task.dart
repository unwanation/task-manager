class Task {
  static int nextId = 0;
  final int id;
  final String name;
  final bool status;
  final int deadline;

  Task({
    required this.id,
    required this.name,
    required this.status,
    required this.deadline,
  });
}
