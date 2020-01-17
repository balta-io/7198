import 'package:mobx/mobx.dart';
import 'package:todo/models/todo-item.model.dart';
part 'todo.store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  bool busy = false;

  @observable
  String selected = "today";

  @observable
  ObservableList<TodoItem> todos = new ObservableList<TodoItem>();

  @observable
  String picture = "https://placehold.it/80";

  @action
  void changeSelected(String selection) {
    selected = selection;
  }

  @action
  void add(TodoItem item) {
    todos.add(item);
  }

  @action
  void setTodos(List<TodoItem> items) {
    todos.addAll(items);
  }

  @action
  void clearTodos() {
    todos = new ObservableList<TodoItem>();
  }
}
