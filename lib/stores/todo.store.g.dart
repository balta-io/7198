// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$busyAtom = Atom(name: '_TodoStore.busy');

  @override
  bool get busy {
    _$busyAtom.context.enforceReadPolicy(_$busyAtom);
    _$busyAtom.reportObserved();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.context.conditionallyRunInAction(() {
      super.busy = value;
      _$busyAtom.reportChanged();
    }, _$busyAtom, name: '${_$busyAtom.name}_set');
  }

  final _$selectedAtom = Atom(name: '_TodoStore.selected');

  @override
  String get selected {
    _$selectedAtom.context.enforceReadPolicy(_$selectedAtom);
    _$selectedAtom.reportObserved();
    return super.selected;
  }

  @override
  set selected(String value) {
    _$selectedAtom.context.conditionallyRunInAction(() {
      super.selected = value;
      _$selectedAtom.reportChanged();
    }, _$selectedAtom, name: '${_$selectedAtom.name}_set');
  }

  final _$todosAtom = Atom(name: '_TodoStore.todos');

  @override
  ObservableList<TodoItem> get todos {
    _$todosAtom.context.enforceReadPolicy(_$todosAtom);
    _$todosAtom.reportObserved();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoItem> value) {
    _$todosAtom.context.conditionallyRunInAction(() {
      super.todos = value;
      _$todosAtom.reportChanged();
    }, _$todosAtom, name: '${_$todosAtom.name}_set');
  }

  final _$pictureAtom = Atom(name: '_TodoStore.picture');

  @override
  String get picture {
    _$pictureAtom.context.enforceReadPolicy(_$pictureAtom);
    _$pictureAtom.reportObserved();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.context.conditionallyRunInAction(() {
      super.picture = value;
      _$pictureAtom.reportChanged();
    }, _$pictureAtom, name: '${_$pictureAtom.name}_set');
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void changeSelected(String selection) {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.changeSelected(selection);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(TodoItem item) {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.add(item);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodos(List<TodoItem> items) {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.setTodos(items);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTodos() {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.clearTodos();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }
}
