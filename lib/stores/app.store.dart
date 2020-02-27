import 'package:mobx/mobx.dart';
import 'package:todo/models/todo-item.model.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String currentState = "none";

  @observable
  bool busy = false;

  @observable
  ObservableList<TodoItem> todos = new ObservableList<TodoItem>();

  @action
  void changeSelected(String state) {
    currentState = state;
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
