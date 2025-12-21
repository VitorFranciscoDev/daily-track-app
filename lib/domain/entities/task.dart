class Task {
  final int? id;
  final String name;
  final String description;
  final bool isDone;

  const Task({
    this.id,
    required this.name,
    required this.description,
    required this.isDone,
  });

  // Task => Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_done': isDone ? 1 : 0,
    };
  }

  // Json => Task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'], 
      description: json['description'], 
      isDone: json['isDone'] == 1,
    );
  }

  // Debug
  @override
  String toString() {
    return "ID: $id, Name: $name, Description: $description, isDone: $isDone";
  }
}