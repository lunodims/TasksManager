class Task {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;

  Task({this.id, required this.title, required this.description, this.isCompleted = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
}
