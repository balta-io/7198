import 'package:flutter/material.dart';
import 'package:todo/components/avatar.widget.dart';
import 'package:todo/controllers/login.controller.dart';
import 'package:todo/views/login.view.dart';
import '../user.dart';

class UserCard extends StatelessWidget {
  final controller = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 40,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: new ExactAssetImage("assets/images/notification.png"),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TDAvatar(
            width: 80,
            path: user.picture,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            user.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            height: 20,
            child: FlatButton(
              child: Text(
                "Sair",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                controller.logout().then((data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                }); // TRATAR POSSÍVEL ERRO
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
