import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/todo.controller.dart';
import 'package:todo/models/todo-item.model.dart';
import 'package:todo/stores/auth.store.dart';
import 'package:todo/stores/todo.store.dart';
import 'package:todo/widgets/user-card.widget.dart';

import 'home.page.dart';

class NewTodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);
    final authStore = Provider.of<AuthStore>(context);
    final controller = new TodoController(store);
    final _formKey = GlobalKey<FormState>();

    String task = "";
    DateTime date = DateTime.now();

    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2000, 1),
        lastDate: DateTime(2040),
      );
      if (picked != null && picked != date) {
        date = picked;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserCard(),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Tarefa",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Título Inválido';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        task = val;
                      },
                    ),
                    FlatButton(
                      child: Text("Data"),
                      onPressed: () {
                        _selectDate(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            Observer(
              builder: (_) => store.busy
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : FlatButton(
                      child: Text(
                        "Adicionar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();
                        var todo = new TodoItem(
                          title: task,
                          date: date,
                        );
                        controller.add(todo, authStore.token).then((_) {
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
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
