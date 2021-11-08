class TodoModel {
  int userId = -1;
  int id = -1;
  String title = '';
  bool completed = false;

  TodoModel(
      {this.userId = -1,
      this.id = -1,
      this.title = '',
      this.completed = false});

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
