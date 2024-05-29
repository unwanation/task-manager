class Task {
  static int nextId = 0;
  final int id;
  final String name;
  final int priority;
  final bool status;
  final int deadline;
  final int spaceId;

  Task({
    required this.id,
    required this.name,
    required this.priority,
    required this.status,
    required this.deadline,
    required this.spaceId,
  });
}
