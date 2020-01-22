import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo/controllers/todo.controller.dart';
import 'package:todo/stores/todo.store.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TodoStore>(context);
    final controller = new TodoController(store);

    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Hoje",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.selected == "today"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("today");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Amanhã",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.selected == "tomorrow"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("tomorrow");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Todas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.selected == "all"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("all");
              },
            ),
          ),
        ],
      ),
    );
  }
}
