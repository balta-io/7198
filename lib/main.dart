import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/login.page.dart';
import 'package:todo/stores/auth.store.dart';
import 'package:todo/stores/todo.store.dart';
import 'package:todo/themes/app.theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>.value(
          value: AuthStore(),
        ),
        Provider<TodoStore>.value(
          value: TodoStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: LoginPage(),
      ),
    );
  }
}
