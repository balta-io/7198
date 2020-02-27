// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$currentStateAtom = Atom(name: '_AppStore.currentState');

  @override
  String get currentState {
    _$currentStateAtom.context.enforceReadPolicy(_$currentStateAtom);
    _$currentStateAtom.reportObserved();
    return super.currentState;
  }

  @override
  set currentState(String value) {
    _$currentStateAtom.context.conditionallyRunInAction(() {
      super.currentState = value;
      _$currentStateAtom.reportChanged();
    }, _$currentStateAtom, name: '${_$currentStateAtom.name}_set');
  }

  final _$busyAtom = Atom(name: '_AppStore.busy');

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

  final _$todosAtom = Atom(name: '_AppStore.todos');

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

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void changeSelected(String state) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.changeSelected(state);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(TodoItem item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.add(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTodos(List<TodoItem> items) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setTodos(items);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearTodos() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearTodos();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
