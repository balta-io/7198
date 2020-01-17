import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/blocs/todo.bloc.dart';
import 'package:todo/models/todo-item.model.dart';
import 'package:todo/stores/todo.store.dart';
import 'package:todo/widgets/user-card.widget.dart';

import 'home.page.dart';

class NewTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);
    final bloc = new TodoBloc(store);

    return Scaffold(
      body: Column(
        children: <Widget>[
          UserCard(),
          Observer(
            builder: (_) => store.busy
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : FlatButton(
                    child: Text("Adicionar"),
                    onPressed: () {
                      var todo = new TodoItem(
                        id: "132",
                        title: "Ir ao supermercado",
                        done: false,
                        date: DateTime.now(),
                      );
                      bloc.add(todo).then((_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      });
                    },
                  ),
          ),
          FlatButton(
            child: Text("Voltar"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text("Hello"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
