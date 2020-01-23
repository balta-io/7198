import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo/models/todo-item.model.dart';

class TodoRepository {
  Future<List<TodoItem>> getTodayTodos(String token) async {
    // var todos = new List<TodoItem>();
    // todos.add(
    //   new TodoItem(
    //     id: "123456",
    //     title: "Hoje",
    //     done: false,
    //     date: DateTime.now(),
    //   ),
    // );
    // await Future.delayed(const Duration(milliseconds: 1500), () {});
    // return todos;
    var url = "https://10.0.2.2:5001/v1/todos/undone/today";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      ),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getTomorrowTodos(String token) async {
    var url = "https://10.0.2.2:5001/v1/todos/undone/tomorrow";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      ),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<List<TodoItem>> getAll(String token) async {
    var url = "https://10.0.2.2:5001/v1/todos";
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      ),
    );
    return (response.data as List)
        .map((todos) => TodoItem.fromJson(todos))
        .toList();
  }

  Future<TodoItem> add(TodoItem item, String token) async {
    var url = "https://10.0.2.2:5001/v1/todos";

    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
        ),
      );
      return TodoItem.fromJson(response.data["data"]);
    } catch (e) {
      return null;
    }
  }
}
