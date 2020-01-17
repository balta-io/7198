import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/components/avatar.widget.dart';
import 'package:todo/pages/login.page.dart';
import 'package:todo/stores/auth.store.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

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
            path: store.picture,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            store.name,
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
                store.clearUser();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
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
