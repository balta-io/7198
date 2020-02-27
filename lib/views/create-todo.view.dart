import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/button.widget.dart';
import 'package:todo/controllers/todo.controller.dart';
import 'package:todo/models/todo-item.model.dart';
import 'package:todo/stores/app.store.dart';
import 'package:todo/widgets/user-card.widget.dart';
import 'home.view.dart';

class CreateTodoView extends StatefulWidget {
  @override
  _CreateTodoViewState createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = new DateFormat('dd/MM/yyyy');

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
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        _dateFormat.format(date),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text("Alterar Data"),
                      onPressed: () {
                        _selectDate(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40,
                top: 20,
                bottom: 10,
              ),
              child: TDButton(
                callback: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                  var todo = new TodoItem(
                    title: task,
                    date: date,
                  );

                  controller.add(todo).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  });
                },
                text: "Salvar",
                width: double.infinity,
              ),
            ),
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
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
