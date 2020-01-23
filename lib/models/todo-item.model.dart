class TodoItem {
  String id;
  String title;
  bool done;
  DateTime date;

  TodoItem({this.id, this.title, this.done, this.date});

  TodoItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    done = json['done'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['done'] = this.done;
    data['date'] = this.date.toString().substring(0, 10);
    return data;
  }
}
