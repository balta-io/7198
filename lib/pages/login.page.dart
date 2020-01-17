import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/blocs/todo.bloc.dart';
import 'package:todo/components/button.widget.dart';
import 'package:todo/pages/home.page.dart';
import 'package:todo/stores/auth.store.dart';
import 'package:todo/stores/todo.store.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context);
    final todoStore = Provider.of<TodoStore>(context);
    final todoBloc = new TodoBloc(todoStore);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Image.asset(
                  "assets/images/notification.png",
                  width: 250,
                ),
                Text(
                  "Olá desconhecido",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TDButton(
                  text: "Login com Google",
                  image: "assets/images/google.png",
                  callback: () {
                    authStore.setUser(
                      "André Baltieri",
                      "https://balta.io/imgs/andrebaltieri.jpg",
                    );
                    todoBloc.changeSelection("today");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
