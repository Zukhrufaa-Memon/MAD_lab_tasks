class TodoItem{
   int? id;
  String title;
  String description;
  bool isCompleted;
  TodoItem({ this.id,required this.title, required this.description,required this.isCompleted,});

Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0, // Convert bool to 0 (false) or 1 (true)
    };
  }

  // Add a factory constructor to convert a map into a TodoItem object
  factory TodoItem.fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1, // Convert 0 or 1 to a bool
    );
  }

}