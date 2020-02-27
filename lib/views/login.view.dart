import 'package:flutter/material.dart';
import 'package:todo/components/button.widget.dart';
import 'package:todo/controllers/login.controller.dart';
import 'package:todo/views/home.view.dart';
import 'package:todo/widgets/busy.widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = new LoginController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  handleSignIn() {
    setState(() {
      busy = true;
    });
    controller.login().then((data) {
      onSuccess();
    }).catchError((err) {
      onError();
    }).whenComplete(() {
      onComplete();
    });
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError() {
    var snackbar = new SnackBar(content: new Text("Falha no login"));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  onComplete() {
    setState(() {
      busy = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: TDBusy(
            busy: busy,
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
                      handleSignIn();
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
      ),
    );
  }
}
