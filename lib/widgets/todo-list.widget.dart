import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/stores/todo.store.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);

    return Observer(
      builder: (_) => store.busy
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.only(
                left: 40,
              ),
              itemCount: store.todos.length,
              itemBuilder: (context, index) {
                var todo = store.todos[index];

                return ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text("Criado em 25/03/2019"),
                );
              },
            ),
    );
  }
}
